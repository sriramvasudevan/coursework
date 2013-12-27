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

        x = num;
        y = 0;
        number = new int[num];
		while((y<x))
		{
			number[y] = y;
			y = y + 1;
		}

		return num;
	}
}
