require 'spec_helper'

describe "Blockblister object" do

	before :all do
		blister_obj = [
			Vhs.new("Good Burger", "Brian Robbins", :comedy),
			Vhs.new("Vanilla Sky", "Cameron Crowe", :drama),
			Vhs.new("Pride & Prejudice", "Joe Wright", :romance),
			Vhs.new("Grizzly Man", "Werner Herzog", :documentary),
			Vhs.new("Spinal Tap", "Christopher Guest", :mockumentary),
		]
		File.open "movies.yml", "w" do |f|
			f.write YAML::dump blister_obj
		end
	end

	before :each do 
		@blister = Blockblister.new "movies.yml"
	end

	describe "#new" do 
		context "with no parameters" do 
			it "has no books" do 
				blister = Blockblister.new
				expect @blister.to have(0).vhss
			end
		end
		context "with a yaml file parameter" do 
			it "has five vhs tapes" do 
				expect @blister.to have(5).vhss
			end
		end
	end

	it "returns all vhs tapes in a given category" do 
		expect @blister.get_videos_in_category(:comedy).length.to == 1
	end

	it "accepts new vhs tapes" do 
		expect @blister.add_vhs( Vhs.new("Bling Ring", "Sofia Coppola", :drama) )
		expect @blister.get_vhs("Bling Ring").to be_an_instance_of Vhs
	end
	
	it "saves the Blockblister" do 
		vhss = @blister.vhss.map { |vhs| vhs.title }
		@blister.save
		blister2 = Blockblister.new "movies.yaml"
		vhs2 = blister2.vhss.map { |vhs| vhs.title }
		expect(vhss).to eql vhs2
	end
end
