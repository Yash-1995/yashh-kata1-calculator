require 'byebug'

class StringCalculatorFactory
  def initialize(input)
    @input = input
  end

  def call
    numbers = string_sanitizer(@input)
    calculator = create_calculator(numbers)
    calculator.calculate
  end

  def string_sanitizer(input)
    return [] if input.empty?
    if input.start_with?("//")
        delimiter, numbers = input.match(%r{//(.)\n(.*)}).captures
        numbers.split(/#{Regexp.escape(delimiter)}/).map(&:to_i)
    else
        input.split(/,|\n/).map(&:to_i)
    end
  end

  def create_calculator(_numbers)
    raise NotImplementedError
  end
end