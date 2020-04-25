def caesar_cipher(message, shift)
    for i in (0..message.size - 1)
        if message[i].match(/[a-zA-Z]/)
            if message[i].ord >= 97
                print ((((message[i].ord + shift) - 97) % 26) + 97).chr
            else
                print ((((message[i].ord + shift) - 65) % 26) + 65).chr
            end
        else
            print message[i]
        end
    end
    puts
end

caesar_cipher("What a string!", 5)