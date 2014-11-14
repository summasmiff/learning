#find the largest value of an int array
	#a = [3,6,774,24,56,2,64,56,34]
	#sort the array
	#a = a.sort
	#only display the largest value
	#puts a[a.length-1]

#ok, so can you do it without resorting to ruby's native sort? let's make some sorts!
	#see /sorts 

#find first missing value in an array
array = [1, 0, 3, 8, 7, 6, 4, 2]
#first, find the sum of the array, then find the sum of the range of the array
sum1 = 0
array.each do |i|
	sum1 += i
end
	a = array
	sum2 = (a.length+1) * (a.length/2)
	puts sum2 - sum1
#the difference is the missingno!

#find the sum of an array
#loop thru array, adding all the values?
	#array = [3,6,774,24,56,2,64,56,34]
	#sum = 0
	#array.each do |i|
		#sum+=i
	#end

	#puts sum