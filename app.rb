require 'sinatra'
require 'pry'
require 'time'
require 'natto'
require 'nkf'
require_relative 'classes/handbook.rb'
require_relative 'classes/date_translator.rb'
require_relative 'classes/time_translator.rb'
# Japanese date translator
class JapaneseDateTranslator < Sinatra::Base
  get '/' do
    erb :date
  end

  post '/date' do
    nm = Natto::MeCab.new('-F%f[7]')
    ne = Natto::MeCab.new
    @date = params[:date]

    @time = params[:time]
    @day = DateTranslator.new(@date).translate_day
    @day_hiragana = NKF.nkf('-h1 -w', nm.parse(@day)).chop.chomp('EOS')
    binding.pry
    @month = DateTranslator.new(@date).translate_month
    @month_hiragana = NKF.nkf('-h1 -w', nm.parse(@month)).chop.chomp('EOS')

    @year = DateTranslator.new(@date).translate_year
    @year_hiragana = NKF.nkf('-h1 -w', nm.parse(@year)).chop.chomp('EOS')

    @time = TimeTranslator.new(@time).convert_time
    @time_hiragana = NKF.nkf('-h1 -w', nm.parse(@time)).chop.chomp('EOS')
    erb :translated_date, layout: false
  end
end
