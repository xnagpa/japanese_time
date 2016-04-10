class HandBook
  class << self
    def jap_digits
      hash ||= { 1 => '一', 2 => '二',
                 3 => '三', 4 => '四',
                 5 => '五', 6 => '六',
                 7 => '七', 8 => '八',
                 9 => '九', 10 => '十',
                 20 => '二十', 30 => '三十',
                 40 => '四十', 50 => '五十',
                 1000 => '千', 100 => '百'
               }
    end

    def jap_words
      hash ||= { day: '日', month: '月',
                 year: '年', hour: '時',
                 minute: '分'
               }
    end

    def special_readings
      {
        '千': { '一千': 'せん', '二千': 'にせん', '三千': 'さんぜん', '四千': 'よんせん', '五千': 'ごせん',
               '六千': 'ろくせん', '七千': 'ななせん', '八千': 'はっせん', '九千': 'きゅうせん',
               '千': 'せん' },
        '百': { '一百': 'ひゃく', '二百': 'にひゃく', '三百': 'さんびゃく', '四百': 'よんひゃく',
               '五百': 'ごひゃく', '六百': 'ろっぴゃく', '七百': 'ななひゃく',
               '八百': 'はっぴゃく', '九百': 'きゅうひゃく', '百': 'ひゃく' },
        '日': { '一日': 'ついたち', '二日': 'ふつか', '三日': 'みっか', '四日': 'よっか', '五日': 'いつか',
               '六日': 'むいか', '七日': 'なのか', '八日': 'ようか', '九日': 'ここのか', '十日': 'とうか',
               '十四日': 'じゅうよっか', '二十四日': 'にじゅうよっか', '二十日': 'はつか' },
        '時': { '四時': 'よじ' },
        '分': {'一分': 'いっぷん', '二分': 'にふん', '三分': 'さんぷん',
               '四分': 'よんぷん', '五分': 'ごぷん', '六分': 'ろっぷん',
               '七分': 'ななふん', '八分': 'はっぷん', '九分': 'きゅうふん',
               '十分': 'じゅっぷん'
             },
        '本': { '一本': 'いっぽん', '三本': 'さんぼん', '四本': 'よんほん',
               '六本': 'ろっぽん', '七本': 'ななほん', '八本': 'はっぽん',
               '九本': 'きゅうぽん', '十本': 'じっぽん' },
        '枚': { '四枚': 'よんまい','九枚': 'きゅうまい' },
        '個': { '一個': 'いっこ', '四個': 'よんこ', '六個': 'ろっこ','九個': 'きゅうこ',
               '十個': 'じっこ'},
      }
    end

    def regular_readings
      {
        '年': 'ねん',
        '月': 'がつ',
        '時': 'じ',
        '一': 'いち', '二': 'に',
        '三': 'さん', '四': 'し',
        '五': 'ご', '六': 'ろく',
        '七': 'しち', '八': 'はち',
        '九': 'く', '十': 'じゅう',
        '日': 'にち',
        '本': 'ほん',
        '枚': 'まい',
        '台': 'だい',
        '個': 'こ'
      }
    end
  end
end

