package base;

import java.util.ArrayList;

public class CFNode {

    public ArrayList<CFNode> successors = new ArrayList<CFNode>();
    public Integer           no;
    public ArrayList<String> in         = new ArrayList<String>();
    public ArrayList<String> out        = new ArrayList<String>();
    public ArrayList<String> use        = new ArrayList<String>();
    public ArrayList<String> def        = new ArrayList<String>();

}
