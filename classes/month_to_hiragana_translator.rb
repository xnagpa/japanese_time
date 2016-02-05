class MonthToHiraganaTranslator
  def kanji_hiragana(kanji_string)
    result = []
    kanji_string.split('').each do |kanji|
      result << HandBook.regular_readings[kanji]
    end
  end
  # def kanji_hiragana(kanji_string)
  #   kanji_type = kanji_string[-1]
  #   special_readings = HandBook.special_readings[kanji_type.to_sym]
  #   regular_readings = HandBook.regular_readings
  #   result = []

  #   kanji_string.chop.split('').reverse_each do |kanji|
  #     if special_readings
  #       result << special_readings[kanji.to_sym]
  #     else
  #       result << regular_readings[kanji.to_sym]
  #     end
  #   end
  #   binding.pry
  #   result << regular_readings[kanji_type]
  #   result.reverse.join('')
  # end
end
