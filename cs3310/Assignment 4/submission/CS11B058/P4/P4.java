import syntaxtree.*;
import visitor.*;
import base.*;

public class P4 {

    /**
     * @param args
     */
    public static void main(String[] args) {
        try {
            Node root = new MiniIRParser(System.in).Goal();
            genMicroIRVisitor mir_visitor = new genMicroIRVisitor();
            root.accept(mir_visitor);
        }
        catch (ParseException e) {
            System.out.println(e.toString());
        }
    }
}
