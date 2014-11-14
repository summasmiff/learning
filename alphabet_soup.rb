#Determine if a string starts with an uppercase letter
def is_upper(c)
	if c == c.capitalize
		return "yep"
	else
		return "nawp"
	end
end

puts is_upper("summer does not know why you would need this")