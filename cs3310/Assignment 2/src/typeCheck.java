import java.io.FileInputStream;
import java.io.FileNotFoundException;

import syntaxtree.*;
import visitor.*;
import base.*;

public class typeCheck {

    /**
     * @param args
     */
    public static void main(String[] args) throws FileNotFoundException {
        try {
            Node root = new MiniJavaParser(new FileInputStream(
                    "test/testing.java")).Goal();
            // Node root = new MiniJavaParser(System.in).Goal();

            symbolTableBuilderVisitor stb_visitor = new symbolTableBuilderVisitor();
            root.accept(stb_visitor);
            //stb_visitor.symtab.printTable();

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