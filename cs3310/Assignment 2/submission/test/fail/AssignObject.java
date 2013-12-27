class t1 
{
	public static void main(String[] args) 
	{
		System.out.println(new Ss().Compute(10));
	}
}

class Ss
{
	Run r1;
	Ss sx;
	public int Compute(int num)
	{
		Run r2;
		sx = new Ss();
		r1 = new Run();
		sx = r1;
				
		return num;
	}
}

class Run
{
	public int foo(int a)
	{
		return a;
	}
}
