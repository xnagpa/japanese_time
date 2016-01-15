require_relative 'handbook.rb'
require 'pry'
# Does the actual work
class DateTranslator
  def initialize(date)
    @date = date
  end

  def translate_day
    return unless @date
    european_date = DateTime.strptime(@date, '%Y-%m-%d')
    japanese_date = []
    if european_date.day / 10 == 0
      japanese_date << HandBook.jap_digits[european_date.day]
    else
      japanese_date << HandBook.jap_digits[(european_date.day - european_date.day % 10)]
      japanese_date << HandBook.jap_digits[(european_date.day % 10)]
    end
    japanese_date << HandBook.jap_words[:day]
    japanese_date.join(' ')
  end

  def translate_month
    return unless @date
    european_date = DateTime.strptime(@date, '%Y-%m-%d')
    japanese_date = []
    if european_date.month / 10 == 0
      japanese_date << HandBook.jap_digits[european_date.month]
    else
      japanese_date << HandBook.jap_digits[(european_date.month - european_date.month % 10)]
      japanese_date << HandBook.jap_digits[(european_date.month % 10)]
    end
    japanese_date << HandBook.jap_words[:month]
    japanese_date.join(' ')
  end

  def translate_year
    # return unless @date
    # european_date = DateTime.strptime(@date, '%Y-%m-%d')
    # japanese_date = []
    # year = european_date.year

    # japanese_date << HandBook.jap_digits[(year % 100 - year % 100 % 10)]
    # japanese_date << HandBook.jap_digits[(european_date.month % 10)]

    # japanese_date << HandBook.jap_digits[(year % 10)]
    # year = year / 10
    # japanese_date << HandBook.jap_digits[(year % 10)]
    # japanese_date << HandBook.jap_words[(year % 10)]

    # japanese_date << HandBook.jap_words[:year]
    # japanese_date.join(' ')

    # if european_date.year / 10 == 0
    #   japanese_date << HandBook.jap_digits[european_date.month]
    # else
    #   japanese_date << HandBook.jap_digits[(european_date.month - european_date.month % 10)]
    #   japanese_date << HandBook.jap_digits[(european_date.month % 10)]
    # end
  end
end
