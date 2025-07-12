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
    return nil if input.empty?
  end

  def create_calculator(_numbers)
    raise NotImplementedError
  end
end