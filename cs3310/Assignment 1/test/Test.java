#define ZERO() (0+0)
class Test{
    public static void main(String[] a){
        System.out.println(new A().run());
    }
}
class A {
    public int run(){
        return ZERO();
    }
}
