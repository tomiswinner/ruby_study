require "stringio"

$stdin = StringIO.new("10
-45 62 -11 81 75 -90 13 2 97 -32
5
-30 65
-90 -90
-15 85
-50 50
-10 -1")

def min_binary(arr, tar)
  left = 0
  right = arr.length - 1
  if tar > arr[right]
    return right + 1
  end

  while left < right
    mid = (left + right) / 2
    if tar <= arr[mid]
      right = mid
    else arr[mid] < tar
      left = mid + 1
    end
    # if tar == -90
    #   print "#{arr}\n"
    #   puts "left:#{arr[left]}, right:#{arr[right]}"
    #   # puts "#{tar}"
    # end
  end
  # target 以上となる最小の添え字
  return left
end

def max_binary(arr, tar)
  left = 0
  right = arr.length - 1
  
  if arr[right] <= tar
    return right
  end
  
  while left < right
    mid = (left + right) / 2
    if arr[mid] < tar
      left = mid + 1
    else 
      right = mid
    end
    # if tar == -90
    #   print "#{arr}\n"
    #   puts "left:#{arr[left]}, right:#{arr[right]}"
      # puts "#{tar}"
    # end
  end
  # target 以下の最大の添え字
  return left
end

def tf_binary(arr, tar)
  left = 0
  right = arr.length - 1
  while left <= right
    mid = (left + right) / 2
    if tar == arr[mid]
      return true
    elsif tar < arr[mid]
      right = mid - 1
    else
      left = mid + 1
    end
    # print "#{arr}\n"
    # puts "left:#{arr[left]}, right:#{arr[right]}"
    # # puts "#{tar}"
  end
  return false
end


arr_len = gets.chomp.to_i

arr = gets.chomp.split.map!{|n| n.to_i}
arr.sort!

n_couples = gets.chomp.to_i

n_couples.times do 
  target = gets.chomp.split.map!{|n| n.to_i}
  if target.first == target.last
    if tf_binary(arr, target.first)
      puts 1
    else
      puts 0
    end
  else
    min_index = min_binary(arr, target.first)
    max_index = max_binary(arr, target.last)
    puts max_index - min_index
  end
end