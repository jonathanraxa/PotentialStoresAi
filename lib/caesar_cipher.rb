class CaesarCipher

    def initialize(word)
        @letters = word.split("")
    end

    def shift(shift)
        @letters.map! do |letter|
            position_in_alpabet = letter.ord
            if (97..122).include? letter.ord #if the letter is lower case
                case shift >= 0 #check if posotive or negative shift
                when true
                    lowercase_shift(position_in_alpabet, shift).chr
                when false
                    lowercase_backshift(position_in_alpabet, shift).chr
                end
            elsif (65..90).include? letter.ord #if the letter is upper case
                case shift >= 0 # check if posotive or negative shift
                when true
                    uppercase_shift(position_in_alpabet,shift).chr
                when false
                    uppercase_backshift(position_in_alpabet, shift).chr
                end
            end
        end
        @letters.join('')
    end
    
    def uppercase_shift(current_pos, shift)
        new_position = current_pos + (shift % 26)
        if new_position > 90
            (new_position % 90) + 64
        else
            new_position
        end
    end
    
    def uppercase_backshift(number, shift)
        (number + shift) > 65 ? (number + shift) : uppercase_shift(number, (26 - shift.abs))
    end
    
    def lowercase_shift(current_pos, shift) 
        new_position = current_pos + (shift % 26)
        if new_position > 122
            (new_position % 122) + 96
        else
            new_position
        end
    end
    
    def lowercase_backshift(number, shift)
        (number + shift) > 97 ? (number + shift) : lowercase_shift(number, (26 - shift.abs)) 
    end
end