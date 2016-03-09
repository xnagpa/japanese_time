require_relative 'handbook.rb'
require_relative 'parser.rb'
require_relative 'universal_translator.rb'
require_relative 'day_to_hiragana_translator.rb'

class CounterWords
  class << self
    attr_accessor :result_hash
    attr_accessor :translated_result
  end

  def self.translate(kanji_string)
    kanji_arr = Parser.new.parse(kanji_string)
    @result_hash = Hash[kanji_arr.map{|str| [str,to_hiragana(str)]}]
                    .sort_by { |k, v| k.length }
    @translated_result = kanji_string.clone

    @result_hash.reverse.each do |key, value|
      @translated_result.gsub!(key,value)
    end
    @translated_result
  end

  private

  def self.to_hiragana(kanji_string)
    type = kanji_string[-1]
    return DigitsToHiraganaTranslator
            .new.kanji_hiragana(kanji_string) unless type
    return DayToHiraganaTranslator
             .new(type).kanji_hiragana(kanji_string) if type == '日'
    return UniversalTranslator.new(type).kanji_hiragana(kanji_string)
  end

  # def self.translate_standalone_kanji(kanji_string)
  #   kanji_string.chars.each do |char|
  #     if HandBook.regular_readings[char]
  #       kanji_string.gsub
  #     end
  #   end
  # end
end
