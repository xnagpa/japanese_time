require 'sinatra'
require 'pry'
require 'time'
require 'kakasi'
require_relative 'classes/handbook.rb'
require_relative 'classes/date_translator.rb'
require_relative 'classes/time_translator.rb'
# Japanese date translator
class JapaneseDateTranslator < Sinatra::Base
  get '/' do
    erb :date
  end

  post '/date' do
    if request.xhr?
      %q{<h1 class="blue">Hello! <a href="/">back</a></h1>}
    else
      "<h1>Not an Ajax request!</h1>"
    end
    @date = params[:date]

    @time = params[:time]
    @day = DateTranslator.new(@date).translate_day
    @day_hiragana = Kakasi.kakasi('-JH', @day)
    @day_romaji = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka', @day)

    @month = DateTranslator.new(@date).translate_month
    @month_hiragana = Kakasi.kakasi('-JH', @month)
    @month_romaji = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka', @month)

    @year = DateTranslator.new(@date).translate_year
    @year_hiragana = Kakasi.kakasi('-JH', @year)
    @year_romaji = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka', @year)

    @time = TimeTranslator.new(@time).convert_time
    @time_hiragana = Kakasi.kakasi('-JH', @time)
    @time_romaji = Kakasi.kakasi('-Ha -Ka -Ja -Ea -ka', @time)
    erb :translated_date, layout: false
  end
end
