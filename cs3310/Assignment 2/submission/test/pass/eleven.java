/*
11. The array dereference operator [] -- the array should be of type int [], and the index should be of type int.
*/

class eleven{
	public static void main(String[] a){
		System.out.println(new simpleLookup().look(2,4));
	}
}

class simpleLookup{

	public int look(int index1,int num){
		int [] arr ;
		int x;
		arr = new int[num] ;
		arr[index1]=6;
		x=arr[index1];
		return x;
	}
}