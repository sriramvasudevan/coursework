class Test8{
    public static void main(String[] a){
        System.out.println(1);
    }
}

//2 errors - case 1. does not return int, case 2. takes boolean as operand
class Finder {
    public int Find(int a,int num){
        int i;
	boolean j;
	j = a-num;
	i = true-num;
	
	return 0;
    }
}
