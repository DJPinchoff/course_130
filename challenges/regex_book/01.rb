def url?(url_string)
  url_string.match?(/^https?:\/\/\S+$/)
end

p url?('http://launchschool.com')   == true
p url?('https://example.com')       == true
p url?('https://example.com hello') == false
p url?('   https://example.com')    == false
