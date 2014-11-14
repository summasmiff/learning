#implement a mergesort in Ruby
class Array
	def mergesort
		return self if self.length <= 1 #can't sort a single unit array
		mid = (self.length/2).to_i #find a midpoint
		left = self[0..mid-1].mergesort  #create left and right array halves, recursively sort them
		right = self[mid..self.length-1].mergesort
		return merge(left, right)
	end
	def merge(left, right) #merge left and right halves
		result = Array.new #create an empty array to dump merged stuff into
		while left.length > 0 || right.length > 0 #while left or right still has stuff in it
			if left.length > 0 && right.length > 0 #if left and right still have stuff
				if left[0] <= right[0] #if left is bigger
					result << left.slice!(0) #push value of left to result, deletes from left
				else
					result << right.slice!(0) #push value of right to result, deletes from right
				end
			elsif left.length > 0 #if only left is still has stuff in it
				result.concat left.slice!(0..left.length - 1) #add all the left stuff to the result
			elsif right.length > 0 
				result.concat right.slice!(0..right.length-1)
			end
		end		
		return result
	end
end

#keep slicin' til there's no more slicin' to slice
puts [3,6,774,24,56,2,64,56,34].mergesort