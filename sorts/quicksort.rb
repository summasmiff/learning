#Initialize a quicksort in Ruby
#Quicksort uses a pivot as a point of reference
def quicksort(array)
	return array if array.length <= 1 #array of 1 value is already sorted

	pivot_point = array.pop#choose a value of the array, doesn't matter which

	left = Array.new #create the greater than array (l and r are used in binary trees, so...)
	right = Array.new #create the lesser than array

	array.each do |i| #for each value, compare to the pivot
		if i <= pivot_point
			right.push(i)
		else
			left.push(i)
		end
	end
	#recursively sort each smaller array, then concat them together again once sorted
	return quicksort(right).push(pivot_point) + quicksort(left)
end

sample_array = (1..99).to_a.sample 10 #picks random 10#s between 1 and 99
sorted_array = quicksort(sample_array)
puts sorted_array