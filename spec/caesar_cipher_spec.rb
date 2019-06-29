require "./lib/caesar_cipher.rb"

RSpec.describe CaesarCipher do 

    before {@caesars_cipher = CaesarCipher.new("#{input}")}
    
    context "input is abcd" do 
        let(:input) {"abcd"}
        it "shifts a lowercase word properly" do
            expect(@caesars_cipher.shift(4)).to eql("efgh")
        end
    end

    context "input is yz" do
        let(:input) {"yz"}
        it "wraps a lowercase word from z to a" do
            expect(@caesars_cipher.shift(2)).to eql("ab")
        end
    end

    context "input is z" do 
        let(:input) {"z"}
        it "wraps a lowercase letter from z to a 601 times" do
            expect(@caesars_cipher.shift(15601)).to eql("a")
        end
    end

    context "input is ABCD" do 
        let(:input) {"ABCD"}
        it "shifts an uppercase word properly" do
            expect(@caesars_cipher.shift(4)).to eql("EFGH")
        end
    end

    context "input is YZ" do
        let(:input) {"YZ"}
        it "wraps an uppercase word from z to a" do
            expect(@caesars_cipher.shift(2)).to eql("AB")
        end
    end

    context "input is Z" do 
        let(:input) {"Z"}
        it "wraps an uppercase letter from z to a 601 times" do 
            expect(@caesars_cipher.shift(15601)).to eql("A")
        end
    end


end

# RSpec.describe "Negative shifts" do

#     describe CaesarCipher do
#         it "lowercase: shifts a letter over by a negative number" do
#             expect(caesar_cipher("c",-2)).to eql("a")
#         end
#     end

#     describe CaesarCipher do
#         it "lowercase: wraps from z to a" do 
#             expect(caesar_cipher("a", -1)).to eql("z")
#         end
#     end

#     describe CaesarCipher do
#         it "lowercase: can wrap from z to a over 100 times" do 
#             expect(caesar_cipher("a", -2601)).to eql("z")
#         end
#     end

#     describe CaesarCipher do
#         it "uppercase: shifts a word over by a negative number" do 
#             expect(caesar_cipher("C",-2)).to eql("A")
#         end
#     end

#     describe CaesarCipher do
#         it "uppercase: wraps from z to a" do 
#             expect(caesar_cipher("A", -1)).to eql("Z")
#         end
#     end

#     describe CaesarCipher do
#         it "uppercase: can wrap from z to a over 100 times" do 
#             expect(caesar_cipher("A", -2601)).to eql("Z")
#         end
#     end

# end