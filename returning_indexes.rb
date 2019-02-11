# Filter indexes when values larger than 10

numarr = [5,11,10,3,123]
p numarr.each_index.select{|i| numarr[i] > 10 }
