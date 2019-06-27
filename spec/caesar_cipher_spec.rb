require "./lib/caesar_cipher.rb"

RSpec.describe "initial tests" do 
    describe "#caesar_cipher" do
        it "shifts a letter over 1 space" do
            expect(caesar_cipher("a", 1)).to eql("b")
        end
    end

    describe "#caesar_cipher" do 
        it "shifts a word over by 5 spaces" do
            expect(caesar_cipher("abcd",4)).to eql("efgh")
        end
    end

    describe "#caesar_cipher" do
        it "shifts a word over by a negative number" do
            expect(caesar_cipher("a",-1)).to eql("z")
        end
    end

end