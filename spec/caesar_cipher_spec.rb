require "./lib/caesar_cipher.rb"

RSpec.describe "posotive shifts" do 

    describe "#caesar_cipher" do 
        it "lowercase: shifts word properly" do
            expect(caesar_cipher("abcd",4)).to eql("efgh")
        end
    end

    describe "#caesar_cipher" do
        it "lowercase: wraps from z to a" do
            expect(caesar_cipher("yz", 2)).to eql("ab")
        end
    end

    describe "#caesar_cipher" do 
        it "lowercase: wraps from z to a 601 times" do
            expect(caesar_cipher("z",(15601))).to eql("a")
        end
    end

    describe "#caesar_cipher" do 
        it "uppercase: shifts word properly" do
            expect(caesar_cipher("ABCD",4)).to eql("EFGH")
        end
    end

    describe "#caesar_cipher" do
        it "uppercase: wraps from z to a" do
            expect(caesar_cipher("YZ",2)).to eql("AB")
        end
    end

    describe "#caesar_cipher" do 
        it "uppercase: wraps from z to a 601 times" do 
            expect(caesar_cipher("Z",15601)).to eql("A")
        end
    end


end

RSpec.describe "Negative shifts" do

    describe "#caesar_cipher" do
        it "lowercase: shifts a letter over by a negative number" do
            expect(caesar_cipher("c",-2)).to eql("a")
        end
    end

    describe "#caesar_cipher" do
        it "lowercase: wraps from z to a" do 
            expect(caesar_cipher("a", -1)).to eql("z")
        end
    end

    describe "#caesar_cipher" do
        it "lowercase: can wrap from z to a over 100 times" do 
            expect(caesar_cipher("a", -2601)).to eql("z")
        end
    end

    describe "#caesar_cipher" do
        it "uppercase: shifts a word over by a negative number" do 
            expect(caesar_cipher("C",-2)).to eql("A")
        end
    end

    describe "#caesar_cipher" do
        it "uppercase: wraps from z to a" do 
            expect(caesar_cipher("A", -1)).to eql("Z")
        end
    end

    describe "#caesar_cipher" do
        it "uppercase: can wrap from z to a over 100 times" do 
            expect(caesar_cipher("A", -2601)).to eql("Z")
        end
    end

end