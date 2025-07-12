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
            delimiter_section, number_section = input.split("\n", 2)

            if delimiter_section.match?(/\[.+\]/)
                delimiter = delimiter_section.match(/\[(.+?)\]/)[1]
                numbers = number_section.split(/#{Regexp.escape(delimiter)}/).map(&:to_i)
            else
                delimiter = delimiter_section[2]
                numbers = number_section.split(/#{Regexp.escape(delimiter)}/).map(&:to_i)
            end
        else
            input.split(/,|\n/).map(&:to_i)
        end
        raise_error_if_found_negative_numbers(get_negative_numbers(sanatized_numbers))

        sanatized_numbers.select{ _1 <= 1000 }
    end

    def create_calculator(_numbers)
        raise NotImplementedError
    end
end




