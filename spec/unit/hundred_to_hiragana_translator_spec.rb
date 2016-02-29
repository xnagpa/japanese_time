require 'classes/hundred_to_hiragana_translator.rb'

RSpec.describe 'Desc' do
  it 'translates year correctly' do
    expect HundredToHiraganaTranslator.new.kanji_hiragana('一年').to eq 'いちねん'
  end

end
