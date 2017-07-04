class SecretHandshake
  COMMANDS = ["wink", "double blink", "close your eyes", "jump"].freeze

  def initialize(input)
    @instructions = input.is_a?(Integer) ? input.to_s(2) : input
  end

  def commands
    result = []
    return result unless @instructions.chars.all? { |char| char.match?(/0|1/) }

    instructions = @instructions.to_i
    5.times do |index|
      instructions, current = instructions.divmod(10)
      if current == 1
        result << COMMANDS[index] unless index == 4
        result.reverse! if index == 4
      end
    end

    result
  end
end
