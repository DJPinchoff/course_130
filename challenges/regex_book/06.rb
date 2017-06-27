def format_date(string)
  string.gsub(/(\d{4})-(\d{2})-(\d{2})/, '\3.\2.\1')
end

p format_date('2016-06-17') #== '17.06.2016'
p format_date('2016/06/17') #== '2016/06/17'

#LS Solution had an \A at the beginning and an \z at the end of the Regex
