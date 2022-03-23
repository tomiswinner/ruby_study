arr = gets.chomp.split("+")

val = 0
arr.each do |elem|
  val += elem.scan('<').length * 10 + elem.scan('/').length 
end

puts val

# scanについて
# https://qiita.com/Kouch/items/87e6352ef2b8bed73c7b