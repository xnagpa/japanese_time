require 'sinatra'
require 'pry'
require 'time'
require 'natto'
require 'nkf'

require_relative 'classes/time_translator.rb'
require_relative 'classes/counter_words.rb'
require_relative 'classes/date_translator.rb'
class JapaneseDateTranslator < Sinatra::Base
  get '/' do
    erb :date
  end

  post '/date' do
    @date = params[:date]

    @time = params[:time]

    @day = DateTranslator.new(@date).translate_day
    @day_hiragana = CounterWords.translate(@day)

    @month = DateTranslator.new(@date).translate_month
    @month_hiragana = CounterWords.translate(@month)

    @year = DateTranslator.new(@date).translate_year
    @year_hiragana  =  CounterWords.translate(@year)

    @time = TimeTranslator.new(@time).convert_time
    @time_hiragana = CounterWords.translate(@time)

    erb :translated_date, layout: false

  end

end
