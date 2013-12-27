package base;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class SymbolTable {

    public HashMap<String, ClassDef> classes = new HashMap<String, ClassDef>();

    public void printTable() {
        Iterator<String> it = classes.keySet().iterator();
        while (it.hasNext()) {
            String key = it.next();
            ClassDef c = classes.get(key);

            putData(c, key);
            System.out.println("Extensions for " + key + ":");
            String parent = c.parent;
            while (parent != null) {
                ClassDef pclass = classes.get(parent);
                putData(pclass, parent);
                parent = pclass.parent;
            }

            System.out.println("----------");
        }
    }

    void putData(ClassDef c, String key) {
        System.out.println("Class: " + key);
        Iterator<String> v = c.vars.keySet().iterator();

        System.out.println("\tVars: ");
        while (v.hasNext()) {
            key = v.next();
            System.out.println("\t\t" + key + ":" + c.vars.get(key));
        }

        v = c.methods.keySet().iterator();
        while (v.hasNext()) {
            key = v.next();

            MethodDef m = c.methods.get(key);
            System.out.println("\tMethod: " + key + ":" + m.ret_type);

            System.out.println("\t\tParams: ");
            Iterator<String> p = m.params.keySet().iterator();
            while (p.hasNext()) {
                key = p.next();
                System.out.println("\t\t\t" + key + ":" + m.params.get(key));
            }

            System.out.println("\t\tLocals: ");
            p = m.locals.keySet().iterator();
            while (p.hasNext()) {
                key = p.next();
                System.out.println("\t\t\t" + key + ":" + m.locals.get(key));
            }
        }
    }

    void printError(String error) {
        // System.out.println(error);
        System.out.println("Type error");
        System.exit(-1);
    }

    public void copyClass(ClassDef to, ClassDef from) {
        Iterator<Map.Entry<String, String>> vars_i;
        vars_i = from.vars.entrySet().iterator();

        // Copy non-existant vars into subclass.
        // (If exists, child overrides parent so don't copy)
        while (vars_i.hasNext()) {
            Map.Entry<String, String> i = vars_i.next();
            if (!to.vars.containsKey(i.getKey())) {
                to.vars.put(i.getKey(), i.getValue());
            }
        }

        Iterator<Map.Entry<String, MethodDef>> methods_i;
        methods_i = from.methods.entrySet().iterator();

        // Copy Methods from parent to child.
        // Handle overriding if method exists in child.
        while (methods_i.hasNext()) {
            Map.Entry<String, MethodDef> i = methods_i.next();
            if (!to.methods.containsKey(i.getKey())) {
                to.methods.put(i.getKey(), i.getValue());
            }
            else {
                // No copying here. Just validation.

                MethodDef to_method = to.methods.get(i.getKey());

                // Overload tests
                /*
                 * //Check if number of params is same
                 * if(to_method.params.size()!=i.getValue().params.size()) {
                 * printError("Overloading!"); }
                 * 
                 * // Check if params match Iterator<Map.Entry<String, String>>
                 * tm_it = to_method.params .entrySet().iterator();
                 * Iterator<Map.Entry<String, String>> fm_it =
                 * i.getValue().params .entrySet().iterator();
                 * 
                 * 
                 * while(tm_it.hasNext()&&fm_it.hasNext()) { Map.Entry<String,
                 * String> tm_i, fm_i; tm_i = tm_it.next(); fm_i = fm_it.next();
                 * if(!tm_i.getValue().equals(fm_i.getValue())) {
                 * printError("Overloading!"); } }
                 */

                // Assuming overriden function only (name match=>signature
                // match)
                // Override tests
                // Check if return types match
                String ret_type = to_method.ret_type;
                if (!ret_type.equals(i.getValue().ret_type)) {
                    // Check if it is a class
                    if (!classes.containsKey(ret_type)) {
                        printError("Override return type mismatch");
                    }

                    ClassDef ret_class = classes.get(ret_type);
                    if (!ret_class.extend.contains(i.getValue().ret_type)) {
                        printError("Override return type mismatch");
                    }
                }
            }
        }
    }

    public void makeIndependent() {
        Iterator<Map.Entry<String, ClassDef>> entries_i;
        entries_i = classes.entrySet().iterator();
        ClassDef parent_class;

        // Build extend List in first pass
        while (entries_i.hasNext()) {
            Map.Entry<String, ClassDef> i = entries_i.next();
            String parent_class_name = i.getValue().parent;

            for (; parent_class_name != null; parent_class_name = parent_class.parent) {
                if (!classes.containsKey(parent_class_name)) {
                    printError("Non-existant parent class.");
                }
                parent_class = classes.get(parent_class_name);
                if (parent_class_name.equals(i.getKey())) {
                    printError("Cyclic extends.");
                }

                // Add to the list of parent classes
                i.getValue().extend.add(parent_class_name);
            }
        }

        // Copy class data in second pass
        entries_i = classes.entrySet().iterator();
        while (entries_i.hasNext()) {
            Map.Entry<String, ClassDef> i = entries_i.next();

            for (String extended_class : i.getValue().extend) {
                parent_class = classes.get(extended_class);
                copyClass(i.getValue(), parent_class);
            }
        }
    }

}
