def rot13(name_array)
  name_array.each do |name|
    string = ""
    name.chars.each do |char|
      letter = case char
               when 'a'..'m', 'A'..'M'
                 char.ord + 13
               when 'n'..'z', 'N'..'Z'
                 char.ord - 13
               else
                 char.ord
               end

      string << letter
    end

    puts string
  end
end

names = ["Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar",
         "Nyna Ghevat", "Puneyrf Onoontr",
         "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
         "Wbua Ngnanfbss", "Ybvf Unvog", "Pynhqr Funaaba",
         "Fgrir Wbof", "Ovyy Tngrf", "Gvz Orearef-Yrr",
         "Fgrir Jbmavnx", "Xbaenq Mhfr", "Fve Nagbal Ubner",
         "Fve Nagbal Ubner", "Lhxvuveb Zngfhzbgb",
         "Unllvz Fybavzfxv", "Tregehqr Oynapu"]

rot13(names)
