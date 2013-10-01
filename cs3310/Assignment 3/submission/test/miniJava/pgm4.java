//.length operator
class pgm4{
    public static void main(String[] a){
        System.out.println(new somename().foo(5));
    }
}

class somename {
    int[] b;
    int a;   
    public int foo(int size){
        b=new int[size];
        System.out.println(b.length);
        return 0;
    }
}
