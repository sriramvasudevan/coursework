#define ONE(C) (1+C)
# define ZERO(A,B,C) (A+(B+(ONE(C))))
#define STUPID(A,B) {  x1 = A/1; x1=x1*B; x1=x1+B; x1=x1-2; }
class Test3{
    public static void main(String[] a){
        System.out.println(new B()._run(0,1,2,3,3,4,5));
    }
}
class A {
    public int _run(int x1, int x2, int x3, int x4, int x5, int x6, int x7 ){
        int[] p;
        p = new int[2];
        p[0]=1;
        
        if(!(false)&true)
            STUPID(1,1);
        else{
            x1=1;
        }
        p[(ZERO(x1+1,2,ONE(4)))-8]=1;
        System.out.println(this.lol(p[x1],1,true,p.length,false));
        
        
        return x1;
    }
    
    public int lol(int a, int b, boolean r, int z, boolean f){
        
        
        
        
        return a;
    }
}

class B extends A {
    
}
