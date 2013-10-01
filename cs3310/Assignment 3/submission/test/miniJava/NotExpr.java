class NotExpr {
    public static void main(String[] a){
            System.out.println(new Fac().ComputeFac(10));
        }
}

class Fac {
    public int ComputeFac(int num){
            int num_aux ;
            boolean a;
            a = !(num < 1);
            if (a)
                num_aux = 1 ;
            else
                num_aux = num * (this.ComputeFac(num-1)) ;
            return num_aux ;
        }
}
