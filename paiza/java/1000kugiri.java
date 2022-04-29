import java.util.*;

public class Main{
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		String str[] = sc.nextLine().split(" ");
		for(String s: str){
			System.out.println(s);
		}
		sc.close();
	}
}
