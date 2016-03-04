class UniversalTranslator
  def initialize(kanji_type)
    @kanji_type = kanji_type
  end

  def kanji_hiragana(kanji_string)
    result = []
    string_to_array_of_couples(kanji_string.chars).each do |couple|
      if !check_whole_word(couple) || check_whole_word(couple).empty?
        result << process_manually(couple)
      else
        result << check_whole_word(couple)
      end
    end
    result.join('')
  end

  def check_whole_word(kanji_string)
    type = @kanji_type.to_sym
    return if HandBook.special_readings[type].nil?

    result = []
    HandBook.special_readings[type].keys.each do |word|
      next if kanji_string != word.to_s
      result << HandBook.special_readings[type][kanji_string.to_sym]
    end
    result.join('')
  end

  def process_manually(kanji_string)
    result = []
    kanji_string.split('').each do |kanji|
      result << HandBook.regular_readings[kanji.to_sym]
    end
    result.join('')
  end

  def string_to_array_of_couples(arr)
    couple = []
    result_arr = []
    arr.reverse.each do |x|
      couple << x
      if couple.length == 2 || x == arr.first
        result_arr.unshift couple.reverse.join
        couple = []
      end
    end
    result_arr
  end
end
