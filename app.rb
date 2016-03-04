require 'sinatra'
require 'pry'
require 'time'
require 'natto'
require 'nkf'

require_relative 'classes/counter_words.rb'
# Japanese date translator
class JapaneseDateTranslator < Sinatra::Base
  get '/' do
    erb :date
  end

  post '/date' do
    binding.pry
    @date = params[:date]

    @time = params[:time]

    @day = DateTranslator.new(@date).translate_day
    @day_hiragana = CounterWords.translate(@day)

    @month = DateTranslator.new(@date).translate_month
    @month_hiragana = CounterWords.translate(@month)
    @year_hiragana = []

    @year = DateTranslator.new(@date).translate_year
      @year_hiragana << kanji_hiragana(word)

    @year_hiragana = @year_hiragana.join('')

    @time = TimeTranslator.new(@time).convert_time
    #binding.pry
    erb :translated_date, layout: false

    # @day_hiragana = NKF.nkf('-h1 -w', nm.parse(@day)).chop.chomp('EOS')
    # binding.pry
    # @month = DateTranslator.new(@date).translate_month
    # @month_hiragana = NKF.nkf('-h1 -w', nm.parse(@month)).chop.chomp('EOS')

    # @year = DateTranslator.new(@date).translate_year
    # @year_hiragana = NKF.nkf('-h1 -w', nm.parse(@year)).chop.chomp('EOS')

    # @time = TimeTranslator.new(@time).convert_time
    # @time_hiragana = NKF.nkf('-h1 -w', nm.parse(@time)).chop.chomp('EOS')
  end

  # def translate(kanji_string)
  #   return DigitsToHiraganaTranslator
  #           .new.kanji_hiragana(kanji_string) unless kanji_string[-1]
  #   return DayToHiraganaTranslator
  #            .new(kanji_string[-1]).kanji_hiragana(kanji_string) if kanji_string[-1] == '日'
  #   return UniversalTranslator.new(kanji_string[-1]).kanji_hiragana(kanji_string)
  # end
end
