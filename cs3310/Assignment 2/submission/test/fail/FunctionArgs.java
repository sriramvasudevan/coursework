class FunctionArgs {
    public static void main(String[] a){
      System.out.println(new Faci().ComputeFac(10, arr, false));
    }
}

class Fac {
    public int ComputeFac(int num, boolean awesome) {
        int num_aux;
        if (num < 1)
            num_aux = 1 ;
        else
            num_aux = num * (this.ComputeFac(num-1, awesome)) ;
        return num_aux ;
    }
}
