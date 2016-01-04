class AnagramChecker
  def is_anagram? word1, word2
    if same_length? word1, word2
      return true if evaluate word1, word2
    end
    false
  end

  def evaluate word1, word2
    array1 = word1.split('')
    array2 = word2.split('')
    temp = array2
    array1.each do |char1|
      array2.each_with_index do |char2, index|
        temp.delete_at(index) if char1 == char2
      end
    end
    array_length(temp) == 0
  end

  def same_length? word1, word2
    array_length(word1.split('')) == array_length(word2.split(''))
  end

  def array_length arr
    count = 0
    arr.each { count += 1 }
    count
  end

  def get_inputs
    puts 'Enter two strings and I\'ll tell you if they\'re anagrams:'
    print 'Enter the first string: '
    word1 = gets.chomp.downcase
    print 'Enter the second string: '
    word2 = gets.chomp.downcase
    return word1, word2
  end

  def run
    word1, word2 = get_inputs
    answer = is_anagram? word1, word2
    puts "\"#{word1}\" and \"#{word2}\" are#{'n\'t' if !answer} anagrams."
  end
end

if __FILE__ == $0
  checker = AnagramChecker.new
  checker.run
end