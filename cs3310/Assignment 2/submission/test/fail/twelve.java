/*
12. The .length operator -- should be applied only on an integer array.
*/

class twelve{
	public static void main(String[] a){
		System.out.println(new simpleLookup().look(4));
	}
}

class simpleLookup{

	public int look(int num){
		int [] arr ;
		int x;
		arr = new int[num] ;
		arr[2]=true;
		x=x.length;
		return x;
	}
}
