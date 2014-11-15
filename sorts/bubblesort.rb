#Implement a bubble sort in Ruby
def bubblesort(array)
	return array if array.length <= 1 #already sorted
	swapped = true
	while swapped do
		swapped = false
		0.upto(array.length-2) do |i|
			if array[i] > array[i+1]
				array[i], array[i+1] = array[i+1], array[i] #swap value
				swapped = true
			end
		end
	end

	puts array
end

puts [3,6,774,24,56,2,64,56,34].bubblesort.inspect
