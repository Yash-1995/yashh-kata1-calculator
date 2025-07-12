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
        sanatized_numbers = if input.start_with?("//")
            delimiter, numbers = input.match(%r{//(.)\n(.*)}).captures
            numbers.split(/#{Regexp.escape(delimiter)}/).map(&:to_i)
        else
            input.split(/,|\n/).map(&:to_i)
        end
        raise_error_if_found_negative_numbers(get_negative_numbers(sanatized_numbers))
        sanatized_numbers
    end

    # We can move this logic to add string calculator as well if we are going to add another calculator but with different cases
    def get_negative_numbers(sanatized_numbers)
        sanatized_numbers.select{ _1.negative? }
    end

    def raise_error_if_found_negative_numbers(negative_numbers)
        if negative_numbers.any?
            raise "Negative Numbers are not allowed. You have passed negative numbers: #{negative_numbers.join(",")}"
        end
    end

    def create_calculator(_numbers)
        raise NotImplementedError
    end
end