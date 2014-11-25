class BinaryHeap
	def initialize #setting up our 2 values
		@data = [3,6,774,24,56,2,64,56,34]
	end

	def add!(x) 
		@data << x
		bubble_up(@data.length - 1)
		self
	end

	def top
		@data[0]
	end

	def remove_top!()
		raise RuntimeError, "Empty Heap" if @data.length == 0
		if @data.length == 1
			@data = []
		else
			@data[0] = @data.pop
			bubble_down(0)
		end
		self
	end

	def length
		@data.length
	end

	private

	def bubble_down(i)
		while true
			left = 2*i + 1 #heap is an array - equation here is computing the index value of a childe
			right = 2*i + 2

			child = compare(left, right) ? left : right

			if !compare(i, child) #! means overwriting
				swap!(i, child)
				i = child #recursive
			else
				break #don't swap if you don't need to
			end
		end
	end

	def bubble_up(i) #set up rules for checking to move up the tree
		while i != 0 #don't divide by zero
			parent = (i-1)/2 #equation for computing index value of a parent

			if compare(i, parent)
				swap!(i, parent)
			end
			i = parent #recursive
		end
	end

	def compare(lhs, rhs)
		return true if rhs >= @data.length

		@data[lhs].send(@comparator, @data[rhs])
	end


	class MaxHeap < BinaryHeap
		def initialize
			super(:>)
		end
	end

	class MinHeap < BinaryHeap
		def initialize
			super(:<)
		end
	end
end

test = BinaryHeap.new
puts test.inspect


#heap' is a collection of nodes, connected to other nodes, in a special way
#that satisfies the 'heap property': if A is parent of B, a:b is the same as b:b's child and so on. All nodes have the same relationship, whatever that may be.
#if a parent is always greater than its childe, this is called a max heap
#A min heap has smallest value at the top
#
#in a heap the highest (or lowest, with minheap) is always at the root of the tree. 
#it is not ordered except for parent/child relationship. 
#siblings mean nothing to heaps. heaps are for establishing priority, not making friends.

#mostly heaps are binary. they are called binary heaps. each parent has two children. 

#since siblings don't matter, heaps can be displayed as arrays, like so:
#[a, b, b, c, c, c, c]
#a is root, b is a's childe, c is b's childe, and so on.
#since it is binary, each parent will have (parentx2) children 

#that way you can calculate how to move up and down the heap using the array's index values

#heaps can be used dynamically as reordering them is less of a big deal than some other data structures

#you stick your new value in whereever, and it sorts it up or down the tree until it becomes the parent or childe it is supposed to be. this is fast cause you only have to compare the value to a few nodes, as opposed to all of them (as in a standard sort)

#big O for binary heaps is not bad: O(n log n)