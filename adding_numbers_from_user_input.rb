puts "Type a number:"

# initial sum
sum = 0

# get numbers from user input/stdin
# chop the last char (a line break \n)
until (char = gets.chomp) == 'q'
  sum += char.to_i # make sure it is integer
end

# print sum
puts "Sum: #{sum}"
