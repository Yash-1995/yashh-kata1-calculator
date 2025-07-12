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
        original_input = input
        return [] if input.empty?

         # the following input is NOT ok: “1,\n” (not need to prove it - just clarifying)
        raise "Input in wrong format #{original_input}" if input =~ /,\n|\n,/

        sanatized_numbers = input.scan(/-?\d+/).map(&:to_i)
        
        raise_error_if_found_negative_numbers(get_negative_numbers(sanatized_numbers))

        sanatized_numbers.select{ _1 <= 1000 }
    end

    def create_calculator(_numbers)
        raise NotImplementedError
    end
end




