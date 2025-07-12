require_relative "string_calculator_factory"
require_relative "add_string"

class AddStringCalculator < StringCalculatorFactory
    def create_calculator(numbers)
        AddString.new(numbers)
    end


    def get_negative_numbers(sanatized_numbers)
        sanatized_numbers.select{ _1.negative? }
    end

    def raise_error_if_found_negative_numbers(negative_numbers)
        if negative_numbers.any?
            raise "Negative Numbers are not allowed. You have passed negative numbers: #{negative_numbers.join(",")}"
        end
    end
end