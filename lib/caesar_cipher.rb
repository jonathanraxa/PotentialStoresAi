class CaesarCipher

    def initialize(word)
        @letters = word.split("")
    end

    def shift(shift_factor)
        @letters.map! do |letter|
            position_in_alpabet = letter.ord
            if (97..122).include? letter.ord #if the letter is lower case
                case shift_factor >= 0 #check if posotive or negative shift
                when true
                    lowercase_shift(position_in_alpabet, shift_factor).chr
                when false
                    lowercase_backshift(position_in_alpabet, shift_factor).chr
                end
            elsif (65..90).include? letter.ord #if the letter is upper case
                case shift_factor >= 0 # check if posotive or negative shift
                when true
                    uppercase_shift(position_in_alpabet,shift_factor).chr
                when false
                    uppercase_backshift(position_in_alpabet, shift_factor).chr
                end
            end
        end
        @letters.join('')
    end
    
    private
    def uppercase_shift(current_pos, shift_factor)
        new_position = current_pos + (shift_factor % 26)
        if new_position > 90
            (new_position % 90) + 64
        else
            new_position
        end
    end
    
    def uppercase_backshift(number, shift_factor)
        (number + shift_factor) > 65 ? (number + shift_factor) : uppercase_shift(number, (26 - shift_factor.abs))
    end
    
    def lowercase_shift(current_pos, shift_factor) 
        new_position = current_pos + (shift_factor % 26)
        if new_position > 122
            (new_position % 122) + 96
        else
            new_position
        end
    end
    
    def lowercase_backshift(number, shift_factor)
        (number + shift_factor) > 97 ? (number + shift_factor) : lowercase_shift(number, (26 - shift_factor.abs)) 
    end
end