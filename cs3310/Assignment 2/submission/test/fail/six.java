/*
6. The < operator should take two integer operators and return an integer.
*/
class six{
    public static void main(String[] a){
        System.out.println(new simpleCompare().compare1(2,true));
    }
}

class simpleCompare{

    public int compare1(int num1,boolean item2){
        int y;
        if(num1<item2){
            y=1;
        }
        else
        {
        	y=2;
        }
        return y;
    }
}
