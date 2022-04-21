def u_bound(arr, tar)
  ng  = -1
  ok = arr.length - 1
  while (ok - ng).abs > 1
    mid = (ok + ng) / 2
    puts "ok:#{ok}, ng:#{ng}, mid:#{mid}"
    if tar >= arr[mid]
      ok = mid
    else
      ng = mid
    end
  end
  return ok
end

x = Array.new(500){ rand(199999) }

x.sort!

print "arr:#{x}\n"
puts "answer:#{u_bound(x, 5000)}"

