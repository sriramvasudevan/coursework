class FunctionArgs {
    public static void main(String[] a){
      System.out.println(new Fac().ComputeFac(10, false));
    }
}

class Fac {
    public int ComputeFac(int num, boolean awesome) {
    	int []hello;
        int num_aux;
        if (num < 1)
            num_aux = 1 ;
        else
            num_aux = num * (this.ComputeFac(num-1, awesome)) ;
        return num_aux ;
    }
}
