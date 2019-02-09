File.open("cytaty.txt", "r") do |f|
    # each_line with index starting from 1
    f.each_line.with_index(1) do |line, index|
    puts "#{index}: #{line}"    
  end
end
