import java.util.LinkedHashSet;
import java.util.Set;

class Main{
	public static void main(String[] args){
		Solution sl = new Solution();
		System.out.println(sl.numSplits("aacaba"));
		System.out.println(sl.numSplits("abcd"));
		System.out.println(sl.numSplits("acbadbaada"));
	}
}

class Solution{
	public int numSplits(String s){
		Set<String> f_LHS = new LinkedHashSet<>();
		Set<String> l_LHS = new LinkedHashSet<>();
		for (int i=0; i<s.length(); i++){
			l_LHS.add(String.valueOf(s.charAt(i)));
		}
		int res_latter = l_LHS.size();
		int cnt = 0;

		for (int i=0; i<s.length(); i++){
			String now = String.valueOf(s.charAt(i));
			f_LHS.add(now);
			// System.out.println(now);
			// System.out.println(s.substring(i+1, s.length()));
			if (s.substring(i+1, s.length()).contains(now) == false){
				res_latter -=1;
				//	System.out.println("含んでない！");
			}
			// System.out.printf("latter:%d, first:%d", res_latter, f_LHS.size());
			// System.out.println("");
			if (res_latter == f_LHS.size()){
				cnt += 1;
			}
			if (res_latter < f_LHS.size()){
				break;
			}
		}
		return cnt;
	}
}
