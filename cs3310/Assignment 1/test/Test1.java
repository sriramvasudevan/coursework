#define f(a) (a+a)
class Test1{
    public static void main(String[] a){
        System.out.println(new A().run());
    }
}
class A {
    public int run(){
        return f(f(4));
    }
}
