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
	public int Compute(int num)
	{
		Run r2;
		r1 = new Run();
		r2 = r1.foo(num);
		
		return num;
	}
}

class Run
{
	public Run foo(int a)
	{
		Run rx;
		rx = new Run();
		
		return rx;
	}
}
