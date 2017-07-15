class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def initialize(size)
    @buffer = Array.new(size, nil)
  end

  def read
    if buffer_empty?
      raise BufferEmptyException
    else
      result = @buffer[0]
      move_buffer_over
      @buffer[-1] = nil
      result
    end
  end

  def write(input)
    if buffer_has_empty_slot?
      if input != nil
        @buffer.each_with_index do |slot, index|
          if slot.nil?
            @buffer[index] = input
            break
          end
        end
      end
    else
      raise BufferFullException
    end
  end

  def write!(input)
    if buffer_has_empty_slot?
      write(input)
    else
      if input != nil
        move_buffer_over
        @buffer[-1] = input
      end
    end
  end

  def clear
    @buffer.each_with_index do |_, index|
      @buffer[index] = nil
    end
  end

  private

  def buffer_empty?
    @buffer.all? { |slot| slot.nil? }
  end

  def buffer_has_empty_slot?
    @buffer.any? { |slot| slot.nil? }
  end

  def move_buffer_over
    @buffer.each_with_index do |slot, index|
      break if index == @buffer.size - 1
      @buffer[index] = @buffer[index + 1]
    end
  end
end
