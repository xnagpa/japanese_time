class YearToHiraganaTranslator
  def kanji_hiragana(kanji_string)
    result = []
    kanji_string.split('').each do |kanji|
      result << HandBook.regular_readings[kanji]
    end
  end
end
