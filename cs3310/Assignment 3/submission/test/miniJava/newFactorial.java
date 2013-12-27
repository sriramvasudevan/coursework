class newFactorial {
    public static void main(String[] a) {
        System.out.println(new Fac().ComputeFac(10));
    }
}

class Fac {
    int temp;
    int temp2;

    public int ComputeFac(int num) {
        int num_aux;
        if (num < 1)
            num_aux = 1;
        else
            num_aux = num * (this.ComputeFac(num - 1));
        temp = num_aux;
        temp = 1;
        return num_aux;
    }

    public int testFac() {
        temp = temp + temp2;
        return temp;
    }
}
