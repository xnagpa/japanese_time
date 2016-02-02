class TimeTranslator
  def initialize(time)
    @time = Time.parse(time)
  end

  def convert_time
    "#{add_mid}#{translate_digits(@time.hour)}#{HandBook.jap_words[:hour]}#{translate_digits(@time.min)}#{HandBook.jap_words[:minute] unless @time.min == 0}"
  end

  def translate_digits(time)
    japanese_hours = []
    if time / 10 == 0
      japanese_hours << HandBook.jap_digits[time]
    else
      japanese_hours << HandBook.jap_digits[(time - time % 10)]
      japanese_hours << HandBook.jap_digits[(time % 10)]
    end
    japanese_hours.join('')
  end

  def add_mid
    binding.pry
    @time.hour < 12 ? '午前' : '午後'
  end
end
