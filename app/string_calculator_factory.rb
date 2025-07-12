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

        sanatized_numbers = input.scan(/-?\d+/).map(&:to_i)
        
        raise_error_if_found_negative_numbers(get_negative_numbers(sanatized_numbers))

        sanatized_numbers.select{ _1 <= 1000 }
    end

    def create_calculator(_numbers)
        raise NotImplementedError
    end
end




