import syntaxtree.*;
import visitor.*;
import base.*;

public class P3 {

    /**
     * @param args
     */
    public static void main(String[] args) {
        try {

            Node root = new MiniJavaParser(System.in).Goal();

            symbolTableBuilderVisitor stb_visitor = new symbolTableBuilderVisitor();
            root.accept(stb_visitor);

            genMiniIRVisitor tc_visitor = new genMiniIRVisitor();
            tc_visitor.symtab = stb_visitor.symtab;
            root.accept(tc_visitor);
        }
        catch (ParseException e) {
            System.out.println(e.toString());
        }
    }
}
