import java.util.*;
import java.util.stream.Collectors;

class Main{
	public static void main(String[] args){
		Solution sl = new Solution();
		// 無名配列
		System.out.println(sl.mincostTickets(new int[] {1,4,6,7,8,20}, new int[] {2,7,15}));
		System.out.println(sl.mincostTickets(new int[] {1,2,3,4,5,6,7,8,9,10,30,31}, new int[] {2,7,15}));
	}
}


class Solution{
	public int mincostTickets(int[] days, int[] costs){
		Map<Integer, Integer> dp = new HashMap<>();
		for(int i=0; i<=days[days.length-1]+1; i++){
			dp.put(i, Integer.MAX_VALUE);
		}
		dp.put(days[days.length-1]+1, 0);
		List<Integer> ls_days = Arrays.stream(days).boxed().collect(Collectors.toList());
		int[] tickets = {1,7,30};

		for(int i=days[days.length-1]; i>=days[0]; i--){
			if (!ls_days.contains(i)){
				dp.put(i, dp.get(i+1));
				continue;
			}
			for (int j=0; j<3; j++){
				if (i+tickets[j] >= days[days.length-1]+1){
					dp.put(i, Math.min(dp.get(i), costs[j]+dp.get(days[days.length-1]+1)));
				}else{
					dp.put(i, Math.min(dp.get(i), costs[j]+dp.get(i+tickets[j])));
				}
			}
		}
		// System.out.println(dp.toString());
		return dp.get(days[0]);
	}
}
