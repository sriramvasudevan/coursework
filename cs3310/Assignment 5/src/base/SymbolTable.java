package base;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class SymbolTable {

    public HashMap<String, ArrayList<Integer>>       liveranges   = new HashMap<String, ArrayList<Integer>>();
    ArrayList<Map.Entry<String, ArrayList<Integer>>> active       = new ArrayList<Map.Entry<String, ArrayList<Integer>>>();
    public HashMap<String, String>                   register     = new HashMap<String, String>();
    ArrayList<String>                                free_regs    = new ArrayList<String>();
    public HashMap<String, Integer>                  location     = new HashMap<String, Integer>();
    public HashMap<String, String>                   global_label = new HashMap<String, String>();
    public HashMap<String, Integer>                  arg3         = new HashMap<String, Integer>();
    int                                              stack_ptr    = 0;
    int                                              reg_nos      = 0;

    public void allocRegs(ArrayList<CFNode> rootlist) {
        analyzeLiveness(rootlist);
        genLiveRanges(rootlist);
        // printLiveRanges(); // for debugging
        linearScanRegisterAllocation();
        // printRegMapping(); // for debugging
    }

    // Find union of two sets
    ArrayList<String> getUnion(ArrayList<String> set1, ArrayList<String> set2) {
        ArrayList<String> retset = new ArrayList<String>();
        retset.addAll(set1);
        for (String element : set2) {
            if (!retset.contains(element)) {
                retset.add(element);
            }
        }
        return retset;
    }

    // Find difference of two sets
    ArrayList<String> getDiff(ArrayList<String> set1, ArrayList<String> set2) {
        ArrayList<String> retset = new ArrayList<String>();
        for (String element : set1) {
            if (!set2.contains(element)) {
                retset.add(element);
            }
        }
        return retset;
    }

    // The repeat-until test for liveness
    boolean testSets(ArrayList<CFNode> rootlist,
            HashMap<CFNode, ArrayList<String>> in_new,
            HashMap<CFNode, ArrayList<String>> out_new) {
        ArrayList<CFNode> queue = new ArrayList<CFNode>();
        ArrayList<CFNode> visited = new ArrayList<CFNode>();
        for (CFNode root : rootlist) {
            queue.add(root);
            while (!queue.isEmpty()) {
                CFNode temp = queue.remove(0);
                if (!visited.contains(temp)) {
                    visited.add(temp);
                    for (CFNode node : temp.successors) {
                        if (node == null) {
                            continue;
                        }
                        queue.add(node);
                    }

                    // Test for each n
                    ArrayList<String> temp_test = in_new.get(temp);
                    if (temp_test.size() != temp.in.size()) {
                        return false;
                    }
                    for (String s : temp.in) {
                        if (!temp_test.contains(s)) {
                            return false;
                        }
                    }

                    temp_test = out_new.get(temp);
                    if (temp_test.size() != temp.out.size()) {
                        return false;
                    }
                    for (String s : temp.out) {
                        if (!temp_test.contains(s)) {
                            return false;
                        }
                    }
                }
            }
        }
        return true;
    }

    // Liveness Analysis
    void analyzeLiveness(ArrayList<CFNode> rootlist) {
        ArrayList<CFNode> queue = new ArrayList<CFNode>();
        ArrayList<CFNode> visited = new ArrayList<CFNode>();
        HashMap<CFNode, ArrayList<String>> in_new = new HashMap<CFNode, ArrayList<String>>();
        HashMap<CFNode, ArrayList<String>> out_new = new HashMap<CFNode, ArrayList<String>>();

        do {
            for (CFNode root : rootlist) {
                queue.add(root);
                while (!queue.isEmpty()) {
                    CFNode temp = queue.remove(0);
                    if (!visited.contains(temp)) {
                        visited.add(temp);
                        for (CFNode node : temp.successors) {
                            if (node == null) {
                                continue;
                            }
                            queue.add(node);
                        }

                        // Algo for each n
                        in_new.put(temp, temp.in);
                        out_new.put(temp, temp.out);
                        temp.in = getUnion(temp.use,
                                getDiff(temp.out, temp.def));
                        ArrayList<String> temp_out = new ArrayList<String>();
                        for (CFNode s : temp.successors) {
                            if (s == null) {
                                continue;
                            }
                            temp_out = getUnion(temp_out, s.in);
                        }
                        temp.out = temp_out;
                    }
                }
            }
            visited.clear();
        } while (!testSets(rootlist, in_new, out_new));
    }

    // Generate Live Ranges using the in, out and def data
    void genLiveRanges(ArrayList<CFNode> rootlist) {
        ArrayList<CFNode> queue = new ArrayList<CFNode>();
        ArrayList<CFNode> visited = new ArrayList<CFNode>();

        for (CFNode root : rootlist) {
            queue.add(root);
            while (!queue.isEmpty()) {
                CFNode temp = queue.remove(0);
                if (!visited.contains(temp)) {
                    visited.add(temp);
                    for (CFNode node : temp.successors) {
                        if (node == null) {
                            continue;
                        }
                        queue.add(node);
                    }

                    // Get temps from each n
                    for (String s : temp.in) {
                        ArrayList<Integer> liverange = liveranges.get(s);
                        if (liverange != null) {
                            if (temp.no > liverange.get(1)) {
                                liverange.set(1, temp.no);
                            }
                        }
                        else {
                            liverange = new ArrayList<Integer>();
                            liverange.add(temp.no);
                            liverange.add(temp.no);
                            liveranges.put(s, liverange);
                        }
                    }

                    for (String s : temp.out) {
                        ArrayList<Integer> liverange = liveranges.get(s);
                        if (liverange != null) {
                            if (liverange.get(0) == -1) {
                                liverange.set(0, temp.no);
                            }
                            else if (temp.no < liverange.get(0)) {
                                liverange.set(0, temp.no);
                            }
                        }
                        else {
                            liverange = new ArrayList<Integer>();
                            liverange.add(temp.no);
                            liverange.add(temp.no);
                            liveranges.put(s, liverange);
                        }
                    }

                    for (String s : temp.def) {
                        ArrayList<Integer> liverange = liveranges.get(s);
                        if (liverange != null) {
                            if (liverange.get(0) == -1) {
                                liverange.set(0, temp.no);
                            }
                            else if (temp.no < liverange.get(0)) {
                                liverange.set(0, temp.no);
                            }
                        }
                        else {
                            liverange = new ArrayList<Integer>();
                            liverange.add(temp.no);
                            liverange.add(temp.no);
                            liveranges.put(s, liverange);
                        }
                    }
                }
            }
        }
    }

    // Prints live ranges for each temp
    void printLiveRanges() {
        Iterator<Map.Entry<String, ArrayList<Integer>>> it = liveranges
                .entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, ArrayList<Integer>> i = it.next();
            System.out.println(i.getKey() + " " + i.getValue().get(0) + " "
                    + i.getValue().get(1));
        }
    }

    // Initialize the free registers
    void initFreeRegs() {
        for (int i = 0; i < 8; i++) {
            free_regs.add("s" + i);
            reg_nos++;
        }
        for (int i = 0; i < 10; i++) {
            free_regs.add("t" + i);
            reg_nos++;
        }
    }

    void linearScanRegisterAllocation() {
        // init free regs
        initFreeRegs();

        // Sort the hashmap into a list lr
        Set<Map.Entry<String, ArrayList<Integer>>> lr_set = liveranges
                .entrySet();
        ArrayList<Map.Entry<String, ArrayList<Integer>>> lr = new ArrayList<Map.Entry<String, ArrayList<Integer>>>();
        lr.addAll(lr_set);
        Collections.sort(lr,
                new Comparator<Map.Entry<String, ArrayList<Integer>>>() {
                    public int compare(
                            Map.Entry<String, ArrayList<Integer>> a1,
                            Map.Entry<String, ArrayList<Integer>> a2) {
                        return a1.getValue().get(0) - a2.getValue().get(0);
                    }
                });

        for (Map.Entry<String, ArrayList<Integer>> i : lr) {
            expireOldIntervals(i);
            if (active.size() == reg_nos) {
                spillAtInterval(i);
            }
            else {
                register.put(i.getKey(), free_regs.remove(0));
                active.add(i);
                Collections
                        .sort(active,
                                new Comparator<Map.Entry<String, ArrayList<Integer>>>() {
                                    public int compare(
                                            Map.Entry<String, ArrayList<Integer>> a1,
                                            Map.Entry<String, ArrayList<Integer>> a2) {
                                        return a1.getValue().get(1)
                                                - a2.getValue().get(1);
                                    }
                                });
            }
        }
    }

    void expireOldIntervals(Map.Entry<String, ArrayList<Integer>> i) {
        Iterator<Map.Entry<String, ArrayList<Integer>>> jt = active.iterator();
        while (jt.hasNext()) {
            Map.Entry<String, ArrayList<Integer>> j = jt.next();
            if (j.getValue().get(1) >= i.getValue().get(0)) {
                return;
            }
            free_regs.add(register.get(j.getKey()));
            jt.remove();
        }
    }

    void spillAtInterval(Map.Entry<String, ArrayList<Integer>> i) {
        Map.Entry<String, ArrayList<Integer>> spill = active
                .get(active.size() - 1);
        if (spill.getValue().get(1) > i.getValue().get(1)) {
            register.put(i.getKey(), register.get(spill.getKey()));
            register.remove(spill.getKey());
            location.put(spill.getKey(), stack_ptr++);
            active.remove(active.size() - 1); // fastest way to remove spill
            active.add(i);
            Collections.sort(active,
                    new Comparator<Map.Entry<String, ArrayList<Integer>>>() {
                        public int compare(
                                Map.Entry<String, ArrayList<Integer>> a1,
                                Map.Entry<String, ArrayList<Integer>> a2) {
                            return a1.getValue().get(1) - a2.getValue().get(1);
                        }
                    });
        }
        else {
            location.put(i.getKey(), stack_ptr++);
        }
    }

    // Print out the reg assigned to a temp
    void printRegMapping() {
        System.out.println("Reg mappings:");
        Iterator<Map.Entry<String, String>> it = register.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, String> i = it.next();
            System.out.println(i.getKey() + " " + i.getValue());
        }
        System.out.println("Spills:");
        System.out.println(stack_ptr);
        Iterator<Map.Entry<String, Integer>> it2 = location.entrySet()
                .iterator();
        while (it2.hasNext()) {
            Map.Entry<String, Integer> i = it2.next();
            System.out.println(i.getKey() + " " + i.getValue());
        }
    }
}
