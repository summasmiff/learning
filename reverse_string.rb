#reverse letters in a string
#class String
	#def my_reverse(a)
		#(a.length/2).times {|i| a[i], a[-(i+1)] = a[-(i+1)], a[i] }
		#a
	#end
#end

#return my_reverse("Summer is learning about reversing strings")

#reverse words in a string
def reverse_words(strings)
	strings.each_line.map{|line| line.split.reverse.join(" ")}
end

str = "Summer is learning about reversing strings"
puts reverse_words(str)