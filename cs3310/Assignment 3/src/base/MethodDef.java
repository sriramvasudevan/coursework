package base;

import java.util.HashMap;
import java.util.LinkedHashMap;
import syntaxtree.MethodDeclaration;

public class MethodDef {

    public String                        ret_type;
    public LinkedHashMap<String, String> params   = new LinkedHashMap<String, String>(); // param_name->type
    public HashMap<String, String>       locals   = new HashMap<String, String>();      // local_name->type
    public MethodDeclaration             meth_dec = null;

}
