#write a function that writes the first 30 digits of the fibonacci sequence to the console.

#non recursive
	#def fibonacci(n)
	#	a = [0]
	#	n.times do |i|
	#		if i == 0 
	#			a[i] = 0 
	#		elsif i == 1
	#			a[i] = 1
	#		else
	#			a[i] = a[i-1] + a[i-2]
	#		end
	#end

	#return a[0..n-1]
	#end

	#puts fibonacci(30)

#recursive using enumerator
	#def recursive_fibonacci(n)
		#n.times.each_with_object([0,1]) { |num, obj| obj << obj[-2] + obj[-1] }
	#end
	#puts recursive_fibonacci(30)

#recursive using a hash
	#fib = Hash.new do |f, n|
		#f[n] = if n <= 1
			#n
		#else
			#f[n-1] + f[n-2]
		#end
	#end
	#puts fib[30]

#recursive, plain
def fibo(n)
	if n<=1
		n
	else
		fibo(n-1) + fibo(n-2)
	end
end
#how to print a even seq to the console?
30.times do |i|
	puts fibo(i) if fibo(i) % 2 == 0
	i + 1
end