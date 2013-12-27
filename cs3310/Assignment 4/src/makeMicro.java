import java.io.FileInputStream;
import java.io.FileNotFoundException;

import syntaxtree.*;
import visitor.*;
import base.*;

public class makeMicro {

    /**
     * @param args
     */
    public static void main(String[] args) throws FileNotFoundException {
        try {
            Node root = new MiniIRParser(new FileInputStream(
                    "test/miniIR/LinearSearch.miniIR")).Goal();
            // Node root = new MiniJavaParser(System.in).Goal();

            genMicroIRVisitor mir_visitor = new genMicroIRVisitor();
            root.accept(mir_visitor);
        }
        catch (ParseException e) {
            System.out.println(e.toString());
        }
    }
}
