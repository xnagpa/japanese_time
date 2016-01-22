require_relative 'handbook.rb'
require 'pry'
# Does the actual work
class DateTranslator
  def initialize(date)
    @date = date
  end

  def translate_day
    return unless @date
    european_date = DateTime.strptime(@date, '%m/%d/%Y')
    japanese_date = []
    if european_date.day / 10 == 0
      japanese_date << HandBook.jap_digits[european_date.day]
    else
      japanese_date << HandBook.jap_digits[(european_date.day - european_date.day % 10)]
      japanese_date << HandBook.jap_digits[(european_date.day % 10)]
    end
    japanese_date << HandBook.jap_words[:day]
    japanese_date.join('')
  end

  def translate_month
    return unless @date
    european_date = DateTime.strptime(@date, '%m/%d/%Y')
    japanese_date = []
    if european_date.month / 10 == 0
      japanese_date << HandBook.jap_digits[european_date.month]
    else
      japanese_date << HandBook.jap_digits[(european_date.month - european_date.month % 10)]
      japanese_date << HandBook.jap_digits[(european_date.month % 10)]
    end
    japanese_date << HandBook.jap_words[:month]
    japanese_date.join('')
  end

# this method  is awful shit. Refactor later.
  def translate_year
    return unless @date
    european_date = DateTime.strptime(@date, '%m/%d/%Y')
    japanese_date = []
    year = european_date.year
    japanese_date << HandBook.jap_words[:year]
    if (year % 10) > 0
      japanese_date << HandBook.jap_digits[(year % 10)]
    end
    year /= 10
    if (year % 10) > 0
      japanese_date << HandBook.jap_digits[10]
      (japanese_date << HandBook.jap_digits[(year % 10)]) if year % 10 != 1
    end
    year /= 10
    if (year % 10) > 0
      japanese_date << HandBook.jap_digits[100]
      japanese_date << HandBook.jap_digits[(year % 10)] if year % 10 != 1
    end
    year /= 10
    if (year % 10) > 0
      japanese_date << HandBook.jap_digits[1000]
      japanese_date << HandBook.jap_digits[(year % 10)] if year % 10 != 1
    end

    japanese_date.reverse.join('')
  end
end
