//The & operator should take two booleans and return a boolean.

class five{
    public static void main(String[] a){
        System.out.println(new Fib().ComputeFib(5));
    }
}

class Fib {
    public int ComputeFib(int num){
        int num_aux ;
        int num_aux1;
        int num_aux2;
        //if (!(num < 0) & !(num = 0))
        if (!(num < 0))
            num_aux = 0 ;
        else
        { if(!(num < 1) & (1))
            num_aux = 1;
        else
        {
            num_aux1=this.ComputeFib(num-1);
            num_aux2=this.ComputeFib(num-2);
            num_aux = num_aux1+num_aux2;
        }
        }
        return num_aux ;
    }
}
