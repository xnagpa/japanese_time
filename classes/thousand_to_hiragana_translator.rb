class ThousandToHiraganaTranslator
  def kanji_hiragana(kanji_string)
    result = []
    kanji_string.chars.reverse.each_slice(2).map(&:join).reverse.each do |couple|
      if !check_whole_word(couple.reverse).empty?
        result << check_whole_word(couple.reverse)
      else
        result << process_manually(couple.reverse)
      end
    end
    result.join('')
  end

  def check_whole_word(kanji_string)
    result = []
    HandBook.special_readings[:千].keys.each do |word|
      result << HandBook.special_readings[:千][kanji_string.to_sym] if kanji_string == word.to_s
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
end
