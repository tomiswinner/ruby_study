require "stringio"
$stdin = StringIO.new("3 3
1 1")

Height, Width = gets.chomp.split.map!{|n| n.to_i}

y, x = gets.chomp.split.map!{|n| n.to_i}

Height.times do |h|
  Width.times do |w|
    reachable = false

    if h == y
      if (0 <= w && w == x - 1)||(w <= Width && w == x + 1)
        reachable = true
      end
    end
    if w == x
      if(0 <= h && h == y -1)||(h <= Height && h == y + 1)
        reachable = true
      end
    end
    if h == y && w == x
      reachable = true
    end

    if reachable
      print '*'
    else
      print '.'
    end
  end
  print "\n"
end
