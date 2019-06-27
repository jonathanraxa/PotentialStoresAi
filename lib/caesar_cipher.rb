def caesar_cipher(string, shift)
    letters = string.split('')
    letters.map! do |letter|
        number = letter.ord
        # number += shift if letter.between?('a','z') || letter.between?('A', 'Z')
        if (97..122).include? letter.ord
            return shift_97(shift).chr
        elsif (65..90).include? letter.ord
            return shift_65(shift).chr
        end
        # number.chr
    end
    
    return letters.join('')
end

def shift_97(number)
    (number % 26) + 97
end 
def shift_65(number)
    (number % 26) + 65
end
