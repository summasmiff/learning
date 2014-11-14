#counts up to 50
#replaces multiples of 3 with fizz
#replaces multiples of 5 with buzz
#replaces multiples of both with fizzbuzz

51.times do |count|
	if count % 15 == 0
		puts "fizzbuzz"
	elsif count % 5 == 0
		puts "buzz"
	elsif count % 3 == 0
		puts "fizz"
	else
		puts "#{count}"
	end
	count + 1
end