require_relative "string_calculator_factory"
require_relative "add_string"

class AddStringCalculator < StringCalculatorFactory
  def create_calculator(numbers)
    AddString.new(numbers)
  end
end