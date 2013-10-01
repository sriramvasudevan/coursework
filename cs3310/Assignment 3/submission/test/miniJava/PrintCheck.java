class PrintCheck 
{
	public static void main(String[] args) 
	{
		System.out.println(new Ss().Compute(10, 11, true));
	}
}

class Ss
{
	int[] number;	
	public int Compute(int num, int num2, boolean flag)
	{
		int a;
        number = new int[num+num2];
		a = number.length;
		System.out.println(a);
		return a;
	}
}
