#From an array of strings, find anagrams.
#Bonus: split all anagram sets into their own arrays.

words = ["abc", "cat", "god", "gate", "cab", "grow", "act", "tac", "dog"]

puts words.group_by { |word| word.chars.sort }.values.inspect

#Ruby does this a little too easily...enumerables strike again!
	#group_by creates an array-of-arrays as defined by various parameters
	#parameters: for each |word|, 'sort' by the 'chars' in each 'word'
	#without the additional method 'values', group_by creates a hash where the _key_ is the 
		#matching letters between each word, with each word as the _value_
	#the 'values' method only returns our original array input
	#inspect just displays the result to the console as an array rather than a list