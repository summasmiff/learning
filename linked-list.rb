#implement a linked list in Ruby
class Node #create the class of Node to exist in Ruby
	attr_accessor :node, :next #can read and write node and next

	def initialize(node)
		@node = node
	end
	
	def self.node_list(node, msg = nil)#creating a visual representation of a linked list
	msg ||=""
	return msg[0..-4] if node.nil?
	node_list(node.next, msg << "#{node.node} -> ") #display a node pointing at the next one
	end #needs to be inside Node class to access nodes

	def self.reverse(node)#let's try reversing it using recursion
		return node if node.next.nil? #a single node list doesn't need to be reversed
		head, swap, node.next = node.next, node, nil #create temp pointers for 2, 1, break link between 2 & 1
		link = head.next #temp pointer

		while link != nil #if a link exists
			head.next = swap #1, 2 linkage switched
			swap = head #2 = #1 now
			head = link #1 = #3
			link = link.next #3's link now goes to #4
		end
		head.next = swap #use that temp variable 
		head #back to where we started
	end 
end

node = Node.new("1") #set up first node, give it a value
node_2 = Node.new("2") #make a second node
node.next = node_2 #assign first link between nodes
node_3 = Node.new("3")
node_2.next = node_3
node_4 = Node.new("4")
node_3.next = node_4

#puts node.node #display the node I just set
#puts node.node.class #what type of node is it? => string

#puts node.next #display node assignment

#puts node.next.node #display node_2's content => string

puts Node.node_list Node.reverse(node)