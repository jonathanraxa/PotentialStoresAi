require "./lib/caesar_cipher.rb"

RSpec.describe CaesarCipher do 
    # This test uses "let(:caesars_cipher) . . . " to define the CaesarCipher instannce rather than using "before{@caesars_cipher = . . .}"

    let(:caesars_cipher) { CaesarCipher.new("#{input}") }
    
    context "input is abcd" do 
        let(:input) {"abcd"}
        it "shifts a lowercase word properly" do
            expect(caesars_cipher.shift(4)).to eql("efgh")
        end
    end

    context "input is yz" do
        let(:input) {"yz"}
        it "wraps a lowercase word from z to a" do
            expect(caesars_cipher.shift(2)).to eql("ab")
        end
    end

    context "input is z" do 
        let(:input) {"z"}
        it "wraps a lowercase letter from z to a 601 times" do
            expect(caesars_cipher.shift(15601)).to eql("a")
        end
    end

    context "input is ABCD" do 
        let(:input) {"ABCD"}
        it "shifts an uppercase word properly" do
            expect(caesars_cipher.shift(4)).to eql("EFGH")
        end
    end

    context "input is YZ" do
        let(:input) {"YZ"}
        it "wraps an uppercase word from z to a" do
            expect(caesars_cipher.shift(2)).to eql("AB")
        end
    end

    context "input is Z" do 
        let(:input) {"Z"}
        it "wraps an uppercase letter from z to a 601 times" do 
            expect(caesars_cipher.shift(15601)).to eql("A")
        end
    end


end

RSpec.describe CaesarCipher do
    # This test uses "before{@caesars_cipher = . . .}" instead of using "let(:caesars_cipher) . . ."
    before {@caesars_cipher = CaesarCipher.new("#{input}")}

    context "input is c" do
        let(:input) {"c"}
        it "shifts a lowercase letter over by a negative number" do
            expect(@caesars_cipher.shift(-2)).to eql("a")
        end
    end

    context "input is a" do
        let(:input) {"a"}
        it "wraps a lowercase letter from z to a" do 
            expect(@caesars_cipher.shift(-1)).to eql("z")
        end
    end

    context "input is a" do
        let(:input) {"a"}
        it "wraps a lowercase letter from z to a over 100 times" do 
            expect(@caesars_cipher.shift(-2601)).to eql("z")
        end
    end

    context "input is C" do
        let(:input) {"C"}
        it "shifts an uppercase word over by a negative number" do 
            expect(@caesars_cipher.shift(-2)).to eql("A")
        end
    end

    context "input is A" do
        let(:input) {"A"}
        it "wraps an uppercase letter from z to a" do 
            expect(@caesars_cipher.shift(-1)).to eql("Z")
        end
    end

    context "input is A" do
        let(:input) {"A"}
        it "wraps an uppercase letter from z to a over 100 times" do 
            expect(@caesars_cipher.shift(-2601)).to eql("Z")
        end
    end

end