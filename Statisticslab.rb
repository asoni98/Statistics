f = File.new("./unemploymentdata.csv", "r")
data = f.read
f.close
sum = 0

data1 = data.split("\n")
splitword = []

data1.each do |element|
  splitword = element.split(',')
end

splitword.each do |adding_dummy_variable|
  sum = sum + adding_dummy_variable.to_f
end
puts data1.count
puts sum.inspect


#sum points / total number of points
# top_part = (data[0]-average)**2
# standard_deviation = (top_part/total_number_of_points)**0.5

