# 
s = gets.chomp

t = ''

strings = ['dream', 'dreamer', 'erase', 'eraser']

s_rev = s.reverse
strings.map! {|str| str.reverse!}

dividable? = false

strings.each { |divider|
    if s_rev.slice!(/\A#{divider}/) == divider
      dividable = true
      next
    end
  }
  break
  # ４つにあてはまらねければ、break

  if s_rev == ''
    return 'YES'
  end
  
if dividable
  'YES'
else
  'NO'
end










