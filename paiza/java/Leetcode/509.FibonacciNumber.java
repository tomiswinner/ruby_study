import java.util.Arrays;

class Main{
	public static void main(String[] args){
		Solution sol = new Solution();
		System.out.println(sol.fib(3));
		System.out.println(sol.fib(4));
		
	}
}

class Solution{
	public int fib(int n){
		int fibo [] = new int[31];
		fibo[0] = 0;
		fibo[1] = 1;
		for( int i=2; i < n+1; i++ ){
			fibo[i] = fibo[i-2] + fibo[i-1];
			//	System.out.println(Arrays.toString(fibo));
		}
		return fibo[n];
	}
}
