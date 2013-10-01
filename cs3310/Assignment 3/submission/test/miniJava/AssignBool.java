// Pass

class AssignBool 
{
	public static void main(String[] args) 
	{
		System.out.println(new Ss().Compute(true, 11));
	}
}

class Ss
{
	public int Compute(boolean flag, int num2)
	{
		int y;
		int x;

        x = 0;
        y = 1;
		
		flag = (flag & (x < y));
		return num2;
	}
}
