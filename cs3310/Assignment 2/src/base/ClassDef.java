package base;

import java.util.HashMap;

public class ClassDef {

    public String parent; //parent class
    public HashMap<String, String>    vars    = new HashMap<String, String>();  //var_name->type
    public HashMap<String, MethodDef> methods = new HashMap<String, MethodDef>(); //method_name->method

}
