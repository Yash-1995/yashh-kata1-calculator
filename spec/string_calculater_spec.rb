require_relative '../app/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it "returns 0 for an empty string" do
      expect(AddStringCalculator.new("").call).to eq(0)
    end

    it "returns the number itself if only one number is provided" do
      expect(AddStringCalculator.new("5").call).to eq(5)
    end

    it "returns the sum of two comma separated numbers" do
      expect(AddStringCalculator.new("1,2").call).to eq(3)
    end

    it "returns the sum of any amount of comma separated numbers" do
      expect(AddStringCalculator.new("1,2,3,4").call).to eq(10)
    end

    it "allows newlines between numbers" do
      expect(AddStringCalculator.new("1\n2,3").call).to eq(6)
    end

    it "supports custom delimiter using //;\\n format" do
      expect(AddStringCalculator.new("//;\n1;2").call).to eq(3)
    end

    it "raises exception on passing negative numbers" do
      expect {
        AddStringCalculator.new("1,-2,3,-5").call
      }.to raise_error("Negative Numbers are not allowed. You have passed negative numbers: -2,-5")
    end

    it "raises exception on passing negative numbers" do
      expect(AddStringCalculator.new("10001, 2").call).to eq(2)
    end
  end
end

 