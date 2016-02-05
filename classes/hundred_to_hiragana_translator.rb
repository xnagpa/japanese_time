class HundredToHiraganaTranslator
  def kanji_hiragana(kanji_string)
    result = []
    kanji_string.chars.each_slice(2).map(&:join).each do |couple|
      if !check_whole_word(couple).empty?
        result << check_whole_word(couple)
      else
        result << process_manually(couple)
      end
    end
    result.join('')
  end

  def check_whole_word(kanji_string)
    result = []
    HandBook.special_readings[:百].keys.each do |word|
      result << HandBook.special_readings[:百][kanji_string.to_sym] if kanji_string == word.to_s
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
