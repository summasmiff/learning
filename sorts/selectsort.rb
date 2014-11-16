#Implement a selection sort in Ruby
#Selection sort: look at the array, pick the smallest element, move it all the way to the [0]
#Repeat with the next smallest, moving it to [1], and so on
def selectsort(array)
	return array if array.length <= 1 
	(0..array.length-1).each do |i| #for every element in the array
		min = i
		(i+1..array.length-1).each do |j| 
			min = j if array[j] < array[min] 
		end
		array[i], array[min] = array[min], array[i] #swap the smallest forward thru the line
	end
	array
end

puts selectsort([3,6,774,24,56,2,64,56,34]).inspect