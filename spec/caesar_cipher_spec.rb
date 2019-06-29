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

# RSpec.describe "Negative shifts" do

#     #negative shifting tests.
#     describe "#lowercase_backshift" do
#         xit "shifts a lowercase letter over by a negative number" do
#             expect(lowercase_backshift(97,-2)).to eql(121)
#         end
#     end

#     describe "#lowercase_backshift" do
#         xit "shift a lowercase letter over by a large negative number" do 
#             expect(lowercase_backshift(97, -27)).to eql(122)
#         end
#     end

#     describe "#uppercase_backshift" do
#         xit "shifts a capitalized word over by a negative number" do 
#             expect(uppercase_backshift(65,-2)).to eql(89)
#         end
#     end

#     describe "#uppsercase_backshift" do
#         xit "shifts an uppercase letter over by a large negative numebr" do 
#             expect(uppercase_backshift(65, -27)).to eql(90)
#         end
#     end

# end