#define f(a, b) (a*b)
class Test2{
    public static void main(String[] a){
        System.out.println(new A().run());
    }
}
class A {
    public int run(){
        int a;
		int b;
		a = 5;
		b = 6;
		return f(b, a);
    }
}
