#implement a binary tree in Ruby
module BinaryTree
	class MissingNode
		def to_a
			[]
		end

		def include?(*) #* means literally any value - this class needs to be after Node class
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
		attr_reader :value #(read only)
		attr_accessor :node, :left, :right #each node has two children (can be read/write)

		def initialize(node) #create a node
			@node = node
			@left = MissingNode.new
			@right = MissingNode.new
		end

		def insert(node) #insert a new node into a preexisting tree
			case value <=> node
			when 1 then left.insert(node) #left child is always greater than
			when -1 then right.insert(node) #right child is always less than
			when 0 then false #cannot insert multiple nodes of the same value
			end
		end

		def inspect #display a current node and 1st gen children
			"{#{node}::#{left.inspect}|#{right.inspect}" 
		end

		def include?(node) #search our tree!
			case value <=> node
			when 1 then left.include?(node) #go down the list
			when -1 then right.include?(node) 
			when 0 then true #current node
			end
		end

		private

		def insert_left(node) #inserting children presents its own problems
				left.insert(node) or self.left = Node.new(node)
		end

		def insert_right(node)
				right.insert(node) or self.right = Node.new(node)
		end
	end
end


tree = BinaryTree::Node.new(20)
tree.left = BinaryTree::Node.new(15) 
tree.right = BinaryTree::Node.new(25) #not displaying??
tree.right = BinaryTree::Node.new(35)
tree.insert(3) #not working??
#tree.include?(15) #doesn't display anything?? how does this work
puts tree.inspect