import syntaxtree.*;
import visitor.*;
import base.*;

public class P6 {

    public static void main(String[] args) {
        try {
            Node root = new MiniRAParser(System.in).Goal();

            genMIPSVisitor mips_visitor = new genMIPSVisitor();
            root.accept(mips_visitor);
            printEnd();
        }
        catch (base.ParseException e) {
            System.out.println(e.toString());
        }
    }

    static void printEnd() {
        System.out.println();
        System.out.println("\t.text");
        System.out.println("\t.globl _halloc");
        System.out.println("_halloc:");
        System.out.println("\tli $v0, 9");
        System.out.println("\tsyscall");
        System.out.println("\tj $ra");
        System.out.println();
        System.out.println("\t.text");
        System.out.println("\t.globl _print");
        System.out.println("_print:");
        System.out.println("\tli $v0, 1");
        System.out.println("\tsyscall");
        System.out.println("\tla $a0, newl");
        System.out.println("\tli $v0, 4");
        System.out.println("\tsyscall");
        System.out.println("\tj $ra");
        System.out.println();
        System.out.println("\t.data");
        System.out.println("\t.align   0");
        System.out.println("newl:   .asciiz \"\\n\"");
        System.out.println("\t.data");
        System.out.println("\t.align   0");
        System.out
                .println("str_er: .asciiz \" ERROR: abnormal termination\\n\"");
    }
}
