class InvalidCodonError < RuntimeError; end;

class Translation
  CONVERSION = { Methionine: ["AUG"], Phenylalanine: ["UUU", "UUC"],
                 Leucine: ["UUA", "UUG"], Serine: ["UCU", "UCC", "UCA", "UCG"],
                 Tyrosine: ["UAU", "UAC"], Cysteine: ["UGU", "UGC"],
                 Tryptophan: ["UGG"], STOP: ["UAA", "UAG", "UGA"] }.freeze

  def self.of_codon(string)
    CONVERSION.each_key do |key|
      return key.to_s if CONVERSION[key].include? string
    end

    nil
  end

  def self.of_rna(strand)
    codons = parse_strand(strand)
    proteins = []
    codons.each do |codon|
      proteins << of_codon(codon)
    end

    raise InvalidCodonError if proteins.any? { |item| item.nil? }
    stop_index = proteins.find_index("STOP")
    stop_index ? proteins[0...stop_index] : proteins
  end

  def self.parse_strand(strand)
    parsed_results = []
    index = 0
    while index <= strand.length - 3
      parsed_results << strand[index..index + 2]
      index += 3
    end

    parsed_results
  end
end
