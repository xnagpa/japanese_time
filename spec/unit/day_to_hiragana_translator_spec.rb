require File.expand_path '../../spec_helper.rb', __FILE__
require 'pry'

describe DayToHiraganaTranslator do
  HandBook.special_readings[:日].keys.each do |key|
    it 'translates special days correctly' do
      expect(described_class.new('日').kanji_hiragana(key.to_s)).
        to eq HandBook.special_readings[:日][key]
    end
  end

  it 'translates regular days (十二日) correctly' do
    expect(described_class.new('日').kanji_hiragana('十二日')).
      to eq 'じゅうににち'
  end

  it 'translates regular days (二十二日) correctly' do
    expect(described_class.new('日').kanji_hiragana('二十二日')).
      to eq 'にじゅうににち'
  end
end
