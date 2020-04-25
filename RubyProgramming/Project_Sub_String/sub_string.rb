def substrings(words, dictionary)
    result = {}

    dictionary.each {|word| result[word] = words.downcase.scan(word).length if words.downcase.match(word)}

    return result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)