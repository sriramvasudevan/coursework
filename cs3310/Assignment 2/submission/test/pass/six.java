/*
6. The < operator should take two integer operators and return an integer.
*/
class six{
    public static void main(String[] a){
        System.out.println(new simpleCompare().compare1(2,4));
    }
}

class simpleCompare{

    public int compare1(int num1,int num2){
        int y;
        y=2;
        if(num2<num1)
        {
            y=1;
        }
        
        else
        {
        	y=2;
        }
        return y;
    }
}
