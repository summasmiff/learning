#implement a bogosort
#bonus credit: benchmark it against the other sorts 
require 'benchmark'

def bogosort(array)
	return array if array.length <= 1 #sorted already
	array.sort_by { rand } until array = array.sort
	array
end
	
MyArray = [3,6,774,24,56,2,64,56,34]
#puts bogosort(MyArray).inspect

def quicksort(array)
	return array if array.length <= 1 #array of 1 value is already sorted

	pivot = array.pop#choose a value of the array, doesn't matter which

	left = Array.new #create the greater than array (l and r are used in binary trees, so...)
	right = Array.new #create the lesser than array

	array.each do |i| #for each value, compare to the pivot
		if i <= pivot
			right.push(i)
		else
			left.push(i)
		end
	end
	#recursively sort each smaller array, then concat them together again once sorted
	return quicksort(right).push(pivot) + quicksort(left)
end

puts Benchmark.measure {quicksort((1..9999).to_a.sample 10000)}
puts Benchmark.measure {bogosort((1..9999).to_a.sample 10000)}