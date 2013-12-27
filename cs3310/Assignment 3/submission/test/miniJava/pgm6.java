//new Identifier () -- Id must be declared as a class.


class pgm6{
    public static void main(String[] a){
        System.out.println(new somename().foo(5));
    }
}

class somename {
    int[] b;
    public int foo(int size){
        b=new int[size];
        return 0;
    }
}
