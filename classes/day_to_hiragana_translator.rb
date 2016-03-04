class DayToHiraganaTranslator < UniversalTranslator
  def kanji_hiragana(kanji_string)
    result = []

    if check_whole_word(kanji_string).nil? || check_whole_word(kanji_string).empty?
      result << process_manually(kanji_string)
    else
      result << check_whole_word(kanji_string)
    end
    result.join('')
  end
end
