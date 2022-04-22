# FIFO を使う幅優先探索

height, wigth = gets.chomp.split.map!{|n| n.to_i}

x, y = gets.chomp.split.map!{|n| n.to_i}

queue = []

queue << [y, x]


