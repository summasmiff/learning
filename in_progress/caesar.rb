#Write a Caesar cipher, in Ruby, with a 5 shift
message = "This is a top secret message"

caesar_cipher(message, 5)

Class CaesarCipher
	def initialize(shift)
		@shift = shift
	end

	def encrypt(str)
		str_array = str.split("")
		str_array.map




