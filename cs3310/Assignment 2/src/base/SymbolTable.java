package base;

import java.util.HashMap;
import java.util.Iterator;

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

}
