class DigitsToHiraganaTranslator
  def kanji_hiragana(kanji_string)
    result = []
    kanji_string.split('').each do |kanji|
      result << HandBook.regular_readings[kanji.to_sym]
    end
    result.join('')
  end
end
