require "./lib/caesar_cipher.rb"

RSpec.describe "initial tests" do 
    describe "#caesar_cipher" do
        it "shifts a lowercase letter over 1 number" do
            expect(caesar_cipher("a", 1)).to eql("b")
        end
    end

    describe "#caesar_cipher" do 
        it "shifts a lowercase word over by 4 numbers" do
            expect(caesar_cipher("abcd",4)).to eql("efgh")
        end
    end

    describe "#caesar_cipher" do
        it "shifts a lowercase letter over by a negative number" do
            expect(caesar_cipher("a",-1)).to eql("z")
        end
    end

    describe "#caesar_cipher" do 
        it "shifts a capital letter over by 5 spaces" do
            expect(caesar_cipher("A",5)).to eql("F")
        end
    end

    describe "#caesar_cipher" do
        it "shifts an all capital word over by 1 spaces" do
            expect(caesar_cipher("BRAD",1)).to eql("CSBE")
        end
    end

    describe "#caesar_cipher" do 
        it "shifts a capitalized word over by 3 spaces" do 
            expect(caesar_cipher("Brad",3)).to eql("Eudg")
        end
    end

    describe "#caesar_cipher" do
        it "shifts a capitalized word over by a negative number" do 
            expect(caesar_cipher("Brad",-2)).to eql("Zpyb")
        end
    end

end