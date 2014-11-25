class Blockblister
	attr_accessor :vhss

	def initialize blister_file = false
		@blister_file = blister_file
		@vhss = @blister_file ? YAML::load(File.read(blister_file))
	end

	def get_videos_in_category category 
		@vhss.select do |vhs|
			vhs.category == category
		end
	end

	def add_vhs vhs
		@vhss.push vhs
	end

	def get_vhs title
		@vhss.select do |vhs|
			vhs.title == title
		end.first
	end

	def save blister_file = false
		@blister_file = blister_file || @blister_file || "movies.yml"
		File.open @blister_file, "w" do |f|
			f.write YAML::dump @vhss
		end
	end
end
end
