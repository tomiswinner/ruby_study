A = [1,9,-10,19]
B = [-10,-1,40,13]

x = []
A.each do |elem|
  y = []
  B.each do |elem2|
    y << (elem - elem2).abs
  end
  x << y
end

x.each do |elem|
  print "#{elem}\n"
end
