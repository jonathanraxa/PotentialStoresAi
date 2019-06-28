def caesar_cipher(string, shift)
    letters = string.split('')
    letters.map! do |letter|
        current_pos = letter.ord
        if (97..122).include? letter.ord
            lowercase_shift(current_pos, shift).chr
        elsif (65..90).include? letter.ord
            uppercase_shift(current_pos,shift).chr
        end
    end
    
    return letters.join('')
end

def uppercase_shift(number, shift)
    number = (number + shift)
    if number <= 90
        number
    else
        while number > 90
            number = (number % 90) + 64
        end
    end
    number
end

def lowercase_shift(number, shift)
    number = (number + shift)
    if number < 122
        number 
    else
        while number > 122
            number = (number % 122) + 96
        end
    end
    number
end

def uppercase_backshift(number, shift)
end

def lowercase_backshift(number, shift)
end