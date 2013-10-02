class Factorial4{
    public static void main(String[] a){
        System.out.println(new Fac().ComputeFac(10));
    }
}

class Fac{
	int num2;
	
	int num;
	int [] num1;
	Fac f ;
	public Fac b(Fac f3) {
		Fac1 f2 ;
		int a;
		a = new int[5].length;
		f2 = new Fac1();
		return f2;
	}
    public int ComputeFac(int num){
        int num_aux ;
        
        num_aux = 1;
        num2 = this.ComputeFac(num); 
        if (num < 1)
            num_aux = 1 ;
        else
            num_aux = num * (this.ComputeFac(num-1)) ;
        return num_aux ;
    }
    
}
class Fac1 extends Fac{
	Fac1 f2 ;
	boolean num2;
	int[] a;
	public int c() {
		a = new int[5];
		f = f2;
		num =  this.ComputeFac(this.ComputeFac(a.length));		
		return num;
	}
	public Fac1 b(Fac f3) {
		int x;
		x = 1;
		return f2;
	}
	public boolean fd() {
		return true;
	}
	
	
}

