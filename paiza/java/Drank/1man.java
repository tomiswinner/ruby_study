import java.util.*;

public class Main{
	public static void main(String [] args){
		Scanner sc = new Scanner(System.in);
		int [] nums = new int[2];	
		for(int i = 0; i < 2; i++){
		  String line = sc.nextLine();
		  nums[i]  = Integer.parseInt(line);
		}
		if(nums[0] * nums[1] >= 10000){
			System.out.println("yes");
		}else{
			System.out.println("no");
		}
	
	}
}
