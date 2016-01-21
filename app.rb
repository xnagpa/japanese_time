require 'sinatra'
require 'pry'
require 'time'
require_relative 'classes/handbook.rb'
require_relative 'classes/date_translator.rb'
require_relative 'classes/time_translator.rb'
# Japanese date translator
class JapaneseDateTranslator < Sinatra::Base
  get '/' do
    erb :date
  end

  post '/date' do
    @date = params[:date]

    @time = params[:time]
    @day = DateTranslator.new(@date).translate_day
    @month = DateTranslator.new(@date).translate_month
    @year = DateTranslator.new(@date).translate_year

    @time = TimeTranslator.new(@time).convert_time
    erb :translated_date
  end
end
