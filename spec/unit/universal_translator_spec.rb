require File.expand_path '../../spec_helper.rb', __FILE__

describe UniversalTranslator do
  it 'translates year correctly' do
    expect(described_class.new('年').kanji_hiragana('一年')).to eq 'いちねん'
  end
  it 'translates month correctly' do
    expect(described_class.new('月').kanji_hiragana('一月')).to eq 'いちがつ'
  end

  it 'translates thousand correctly' do
    expect(described_class.new('千').kanji_hiragana('一千')).to eq 'せん'
  end

  it 'translates hundred correctly' do
    expect(described_class.new('百').kanji_hiragana('一百')).to eq 'ひゃく'
  end

  it 'translates hours correctly' do
    expect(described_class.new('時').kanji_hiragana('十一時')).to eq 'じゅういちじ'
    expect(described_class.new('時').kanji_hiragana('四時')).to eq 'よじ'
  end

  it 'Divides kanji string to array of couples' do
    expect(described_class.new('日').string_to_array_of_couples('二十二日'.chars)).
      to eq(['二十','二日'])
    expect(described_class.new('日').string_to_array_of_couples('十二日'.chars)).
      to eq(['十','二日'])
  end

  it 'translates minutes correctly' do
    expect(described_class.new('分').kanji_hiragana('一分')).to eq 'いっぷん'
    expect(described_class.new('分').kanji_hiragana('五十九分')).to eq 'ごじゅうきゅうふん'
    expect(described_class.new('分').kanji_hiragana('三十分')).to eq 'さんじゅっぷん'
  end

end
