def caesar_cipher string, shift
    letters = string.split('')
    letters.map! do |letter|
        number = letter.ord
        number += shift if letter.between?('a','z') || letter.between?('A', 'Z')
        if (97..122) === letter.ord
            until number <= 122 #this loop will make sure your letter stays inside the alphabet. 
                number = (number % 122) + 96
            end
        elsif (65..90) === letter.ord
            until number <= 90 #this loop will make sure your letter stays inside the alphabet. 
                number = (number % 90) + 64
            end
        end
        number.chr
    end
    
    return letters.join('')
end