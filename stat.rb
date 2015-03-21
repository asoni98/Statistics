f = File.new("unemploymentdata.csv" , "r")
data_in_string_form = f.read
f.close

data_in_array_form = data_in_string_form.split("\r")
firstrow = data_in_array_form.shift
row = 0

data_in_array_form.each do |element|
  data_point = element.split(',')
data_value = data_point[1].to_f
row = row + data_value
end

avg = row/68
n = 0
mean = avg

data_in_array_form.each do |element|
  data_point = element.split (',')
  data_value = data_point[1].to_f
  num = (data_value-mean)**2
  n = n + num
end

stdev = (n/68)**0.5

new_array =[]
data_in_array_form.each do |element|
  data_point = element.split (',')
  data_value = data_point[1].to_f
  zscore = (data_value-mean)/stdev
new_array.push zscore
end

final_array = []
68.times do |i|
final_array.push data_in_array_form[i].to_s + "," + new_array[i].to_s
end
final_array.unshift(firstrow)

f = File.new("unemploymentdata2.csv" , "w")
f.write final_array.join ("\n")
f.close