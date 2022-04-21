require "stringio"
$stdin = StringIO.new("10
                      -912274824 -819026501 -744298743 -636316439 -416138312 -150411688 296217905 302421097 374385542 689118107
                      50
                      -16753780
                      302421097
                      286658032
                      -636316439
                      -391190248
                      -150411688
                      689118107
                      -622184818
                      -179585143
                      18227999
                      891738093
                      808823108
                      475785748
                      646704462
                      -744298743
                      386044677
                      -430646172
                      -150411688
                      262129973
                      103164246
                      -912274824
                      338372863
                      -416138312
                      -616032102
                      -75042640
                      -744298743
                      -526701642
                      -997660261
                      -890263673
                      408600229
                      978883570
                      -373617350
                      387520546
                      -912274824
                      63220206
                      689118107
                      -555698625
                      -744298743
                      961961517
                      -739151598
                      302421097
                      -167435306
                      61236582
                      599494365
                      863060010
                      789875532
                      -416138312
                      -649033658
                      -819026501
                      526554078
")

def binary(arr, tar)
  # tar <= の最小値を見つける=その値を見つける
  left_ng = -1
  right_ok = arr.length - 1
  if arr[right_ok] == tar
    return "Yes"
  end
  while (left_ng - right_ok).abs > 1 
    mid = (left_ng + right_ok) / 2
    if tar == arr[mid]
      return "Yes"
    elsif tar < arr[mid]
      right_ok = mid
      # puts "ok"
    else
      left_ng = mid
      # puts "ng"
    end
   # puts "arr[mid]:#{arr[mid]}"
   # print "arr:#{arr}\n"
   # puts "tar: #{tar}"
   # puts "ok:#{right_ok}, ng:#{left_ng}, mid: #{mid}"
  end
  return "No"
end

n = gets.chomp.to_i
arr_A = gets.chomp.split.map!{|n| n.to_i}

q = gets.chomp.to_i
q.times do
  k = gets.chomp.to_i
  puts "#{binary(arr_A, k)}"
end
