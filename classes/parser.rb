class Parser
  #一二三四五六七八九十
  JAP_DIGITS = [19968, 20108, 19977,
                22235, 20116, 20845,
                19971, 20843, 20061,
                21313]
  JAP_SUFFIXES = [21315, 30334, 26085, 26178, 20998]
  def parse(str)
    result_arr = []
    i = 0
    while i < str.length
      result_str = ''

      if JAP_DIGITS.include? str[i].unpack('U')[0]
        j = i
        while (j < str.length) && (JAP_DIGITS.include? str[j].unpack('U')[0])

          result_str << str[j]
          j += 1
        end

        if (j < str.length) && (JAP_SUFFIXES.include? str[j].unpack('U')[0])
          result_str << str[j]
          i = j
        else
          i = j
        end

      end
      result_arr << result_str unless result_str.empty?
      i += 1
    end
    result_arr
  end
end
