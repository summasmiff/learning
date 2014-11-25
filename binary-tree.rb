#implement a binary tree in Ruby
module BinaryTree
	class MissingNode
		def to_a
			[]
		end

		def include?(*) #* means literally any value
			false
		end

		def insert(*)
			false
		end

		def inspect
			"{}"
		end
	end

	class Node #use a similar node structure to a linked list
		attr_accessor :value, :left, :right #each node has two children (can be read/write)

		def initialize(v) #create a node
			@value = v
			@left = MissingNode.new
			@right = MissingNode.new
		end

		def insert(v) #insert a new node into a preexisting tree
			case value <=> v
			when 1 then left.insert(v) #left child is always greater than
			when -1 then right.insert(v) #right child is always less than
			when 0 then false #cannot insert multiple nodes of the same value
			end
		end

		def inspect #display a current node and 1st gen children
			"{#{value}::#{left.inspect}|#{right.inspect}" 
		end

		def include?(v) #search our tree!
			case value <=> v
			when 1 then left.include?(v) #go down the list
			when -1 then right.include?(v) 
			when 0 then true #current node
			end
		end

		private

		def insert_left(v) #inserting children presents its own problems
				left.insert(v) or self.left = Node.new(v)
		end

		def insert_right(v)
				right.insert(v) or self.right = Node.new(v)
		end
	end
end


tree = BinaryTree::Node.new(20)
tree.left = BinaryTree::Node.new(15) 
tree.right = BinaryTree::Node.new(25) 
insert(3) #can i recursively insert without the .left modifier?
puts tree.inspect 