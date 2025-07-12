require_relative "add_string_calculator"

class StringCalculator
  def add(numbers)
    AddStringCalculator.new(numbers).call
  end
end


puts "Welcome to KATA 1 String Calculator, kindly give input below: \n"
input = gets.chomp
puts StringCalculator.new.add(input)