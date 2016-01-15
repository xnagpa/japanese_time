require 'sinatra'
require 'pry'
require_relative 'classes/handbook.rb'
require_relative 'classes/date_translator.rb'
# Japanese date translator
class JapaneseDateTranslator < Sinatra::Base
  get '/' do
    erb :date
  end

  post '/date' do
    @date = params[:date]
    @date = DateTranslator.new(@date).translate_day + ' ' + DateTranslator.new(@date).translate_month
    erb :translated_date
  end
end
