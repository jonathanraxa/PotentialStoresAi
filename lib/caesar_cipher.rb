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

def uppercase_shift(current_pos, shift)
    new_position = current_pos + (shift % 26)
    if new_position > 90
        (new_position % 90) + 64
    else
        new_position
    end
end

# def uppercase_backshift(number, shift)
#     (number + shift) > 65 ? (number + shift) : uppercase_shift(number, (26 - shift.abs))
# end

def lowercase_shift(current_pos, shift)
    new_position = current_pos + (shift % 26)
    if new_position > 122
        (new_position % 122) + 96
    else
        new_position
    end
end

# def lowercase_backshift(number, shift)
#     (number + shift) > 97 ? (number + shift) : lowercase_shift(number, (26 - shift.abs)) 
# end