class DayToHiraganaTranslator
  def kanji_hiragana(kanji_string)
    result = []
    HandBook.special_readings[:日].keys.each do |word|
      return HandBook.special_readings[:日][word] if kanji_string == word.to_s
    end

    kanji_string.split('').each do |kanji|
      result << HandBook.regular_readings[kanji.to_sym]
    end
    result.join('')
  end
end
