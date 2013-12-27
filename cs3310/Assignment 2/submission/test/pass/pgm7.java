//Function call of the form pe1.mm(exprs) -- pe1 must of some object type, the function mm must be declared in pe1. The types of args of mm should match exprs. Try different args - integer, boolean, int [], and objects).

class pgm7{
    public static void main(String[] a){
        System.out.println(new somename().init(1,2,3));
    }
}

class somename {
    public int init(int p1, int p2,int size){
	int[] p3;
	int aux;
	p3=new int[size];
        aux = this.done(p1,p2);
	return 1 ;
    }

    public int done(int p1, int p2){
        return 0 ;
    }
}
