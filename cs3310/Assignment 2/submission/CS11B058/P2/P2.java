import syntaxtree.*;
import visitor.*;
import base.*;

public class P2 {

    /**
     * @param args
     */
    public static void main(String[] args) {
        try {

            Node root = new MiniJavaParser(System.in).Goal();

            symbolTableBuilderVisitor stb_visitor = new symbolTableBuilderVisitor();
            root.accept(stb_visitor);

            typeCheckVisitor tc_visitor = new typeCheckVisitor();
            tc_visitor.symtab = stb_visitor.symtab;
            root.accept(tc_visitor);
            System.out.println("Program type checked successfully");
        }
        catch (ParseException e) {
            System.out.println(e.toString());
        }
    }
}
