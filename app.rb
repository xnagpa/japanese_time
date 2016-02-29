require 'sinatra'
require 'pry'
require 'time'
require 'natto'
require 'nkf'
require_relative 'classes/handbook.rb'
require_relative 'classes/date_translator.rb'
require_relative 'classes/time_translator.rb'
require_relative 'classes/day_to_hiragana_translator.rb'
require_relative 'classes/year_to_hiragana_translator.rb'
require_relative 'classes/month_to_hiragana_translator.rb'
require_relative 'classes/thousand_to_hiragana_translator.rb'
require_relative 'classes/hundred_to_hiragana_translator.rb'
require_relative 'classes/digits_to_hiragana_translator.rb'
require_relative 'classes/parser.rb'
# Japanese date translator
class JapaneseDateTranslator < Sinatra::Base
  get '/' do
    erb :date
  end

  post '/date' do
    # nm = Natto::MeCab.new('-F%f[7]')
    # ne = Natto::MeCab.new
    # translate('二日')
    # translate('十二日')
    # translate('十二年')
    # translate('十二月')
    # translate('一月')
    # translate('一月')
    kanji_arr = Parser.new.parse('一二sdf四千ついたち二十')
    result_arr = kanji_arr.map{|str| translate(str)}
    binding.pry
    # @date = params[:date]

    # @time = params[:time]

    # @day = DateTranslator.new(@date).translate_day
    # @day_hiragana = kanji_hiragana(@day)

    # @month = DateTranslator.new(@date).translate_month
    # @month_hiragana = kanji_hiragana(@month)
    # @year_hiragana = []

    # @year = DateTranslator.new(@date).translate_year
    # @year.scan(/([^千]*千)([^百]*百)([^年]*年)/)[0].each do |word|
    #   @year_hiragana << kanji_hiragana(word)
    # end

    # @year_hiragana = @year_hiragana.join('')

    #@time = TimeTranslator.new(@time).convert_time
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

  def translate(kanji_string)
    klass = HandBook.translator[kanji_string[-1].to_sym]
    return DigitsToHiraganaTranslator.new.kanji_hiragana(kanji_string) unless klass
    translation = Object.const_get(klass).new.kanji_hiragana(kanji_string)

  end
end
