class myGen {
 public static void main(String[] a) {
     System.out.println(10);
}
}

class A {
    
    public A foo () {
        int[] h;
        h = new int[9];       
        return this;
    }
}

class B extends A{
   
    B b;
    C c;
    public A foo() {
        return c.foo0();
    }
}

class C extends A {
    A a;
    public A foo0(){
        return a; 
    }
}

