class WhileCheck
{
	public static void main(String[] args) 
	{
		System.out.println(new Ss().Compute(10));
	}
}

class Ss
{
	int []number;
	public int Compute(int num)
	{
		int x;
		int y;
		Ss s1;
		s1 = new Ss();
		while(s1.Compute(x))
		{
			number[y] = y;
			y = y + 1;
		}

		return num;
	}
}
