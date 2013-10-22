import java.io.FileInputStream;
import java.io.FileNotFoundException;

import syntaxtree.*;
import visitor.*;
import base.*;

public class makeMiniRA {

    /**
     * @param args
     */
    public static void main(String[] args) throws FileNotFoundException {
        try {
            Node root = new microIRParser(new FileInputStream(
                    "test/microIR/Test.microIR")).Goal();
            // Node root = new microIRParser(System.in).Goal();

            genCFG cfg_visitor = new genCFG();
            root.accept(cfg_visitor);
            genMiniRAVisitor mra_visitor = new genMiniRAVisitor();
            mra_visitor.symtab = cfg_visitor.symtab;
            root.accept(mra_visitor);
        }
        catch (base.ParseException e) {
            System.out.println(e.toString());
        }
    }
}
