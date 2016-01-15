class HandBook
  class << self
    def jap_digits
      hash ||= { '1': '一', '2': '二',
                 '3': '三', '4': '四',
                 '5': '五', '6': '六',
                 '7': '七', '8': '八',
                 '9': '九', '10': '十',
                 '20': '二十', '30': '三十',
                 '1000': '千', '100': '百'
               }
    end

    def jap_words
      hash ||= { 'day': '日', 'month': '月',
                 'year': '年'
               }
    end

  end
end