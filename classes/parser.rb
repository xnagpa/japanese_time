class Parser
  #一二三四五六七八九十
  JAP_DIGITS = [19968, 20108, 19977,
                22235, 20116, 20845,
                19971, 20843, 20061,
                21313]
  JAP_SUFFIXES = [21315, 30334, 26085, 26178, 20998, 26376, 24180]
  def parse(str)
    result_arr = []
    i = 0
    while i < str.length
      result_str = ''

      if jap_digit?(str[i])
        j = i
        while (j < str.length) && jap_digit?(str[j])

          result_str << str[j]
          j += 1
        end

        if (j < str.length) && suffix_known?(str[j])
          result_str << str[j]
        end
        i = j
      end
      result_arr << result_str unless result_str.empty?
      i += 1
    end
    result_arr
  end

  private

  def get_unicode(str)
    str.unpack('U')[0]
  end

  def suffix_known?(suffix)
    JAP_SUFFIXES.include? get_unicode(suffix)
  end

  def jap_digit?(str)
    JAP_DIGITS.include? get_unicode(str)
  end
end
