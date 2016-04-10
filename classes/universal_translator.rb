class UniversalTranslator
  def initialize(kanji_type)
    @kanji_type = kanji_type
  end

  def kanji_hiragana(kanji_string)
    result = []
    string_to_array_of_couples(kanji_string.chars).each do |couple|
      translated_couple = translate_couple(couple)
      if !translated_couple || translated_couple.empty?
        result << process_one_by_one(couple)
      else
        result << translated_couple
      end
    end
    result.join('')
  end

  def translate_couple(couple)
    type = @kanji_type.to_sym
    return if HandBook.special_readings[type].nil?

    result = []
    HandBook.special_readings[type].keys.each do |word|
      next if couple != word.to_s
      result << HandBook.special_readings[type][couple.to_sym]
    end
    result.join('')
  end

  def process_one_by_one(couple)
    result = []
    couple.split('').each do |kanji|
      result << HandBook.regular_readings[kanji.to_sym]
    end
    result.join('')
  end

  def string_to_array_of_couples(arr)
    couple = []
    result_arr = []
    arr.reverse_each do |x|
      couple << x
      if couple.length == 2 || x == arr.first
        result_arr.unshift couple.reverse.join
        couple = []
      end
    end
    result_arr
  end
end
