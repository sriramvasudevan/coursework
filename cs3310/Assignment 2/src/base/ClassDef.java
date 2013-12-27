package base;

import java.util.HashMap;
import java.util.ArrayList;

public class ClassDef {

    public String                     parent;                                    // parent_class
    public HashMap<String, String>    vars    = new HashMap<String, String>();   // var_name->type
    public HashMap<String, MethodDef> methods = new HashMap<String, MethodDef>(); // method_name->method
    public ArrayList<String>          extend  = new ArrayList<String>();
}
