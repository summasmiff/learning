require 'spec_helper'

describe Vhs do
	before :each do 
		@vhs = Vhs.new "Title", "Director", :category
	end
	describe "#new" do
		it "takes three parameters and returns a VHS object" do
			expect(@vhs).to be_an_instance_of Vhs
		end
	end
	describe "#title" do
		it "returns the correct title" do
			expect(@vhs.title).to eql "Title"
		end
	end
	describe "#director" do 
		it "returns the correct director" do
			expect(@vhs.director).to eql "Director"
		end
	end
	describe "#category" do
		it "returns the correct category" do
			expect(@vhs.category).to eql :category
		end
	end
end

