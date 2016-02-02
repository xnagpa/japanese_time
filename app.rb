require 'sinatra'
require 'pry'
require 'time'
require 'kakasi'
require 'natto'
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
    @date = params[:date]

    @time = params[:time]
    @day = DateTranslator.new(@date).translate_day
    @day_hiragana = Kakasi.kakasi('-JH', @day)
    @day_romaji = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka', @day)

    @month = DateTranslator.new(@date).translate_month
    @month_hiragana = Kakasi.kakasi('-KH', nm.parse(@month)).chop.chomp('EOS')
    @month_romaji = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka', @month_hiragana)

    @year = DateTranslator.new(@date).translate_year
    @year_hiragana = Kakasi.kakasi('-KH', nm.parse(@year)).chop.chomp('EOS')
    @year_romaji = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka', @year_hiragana)

    @time = TimeTranslator.new(@time).convert_time
    @time_hiragana = Kakasi.kakasi('-KH', nm.parse(@time)).chop.chomp('EOS')
    @time_romaji = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka', @time_hiragana)
    erb :translated_date, layout: false
  end
end
