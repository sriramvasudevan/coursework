import java.io.FileInputStream;
import java.io.FileNotFoundException;

import syntaxtree.*;
import visitor.*;
import base.*;

public class convertJava {

    /**
     * @param args
     */
    public static void main(String[] args) throws FileNotFoundException {
        try {
            Node root = new MiniJavaParser(new FileInputStream(
                    "test/miniJava/BinarySearch.java")).Goal();
            // Node root = new MiniJavaParser(System.in).Goal();

            symbolTableBuilderVisitor stb_visitor = new symbolTableBuilderVisitor();
            root.accept(stb_visitor);
            //stb_visitor.symtab.printTable();

            genMiniIRVisitor tc_visitor = new genMiniIRVisitor();
            tc_visitor.symtab = stb_visitor.symtab;
            root.accept(tc_visitor);
        }
        catch (ParseException e) {
            System.out.println(e.toString());
        }
    }
}
