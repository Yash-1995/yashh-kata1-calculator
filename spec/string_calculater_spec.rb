require_relative '../app/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it "returns 0 for an empty string" do
      expect(AddStringCalculator.new("").call).to eq(0)
    end


it "returns the number itself if only one number is provided" do
  expect(AddStringCalculator.new("5").call).to eq(5)
end
  end
end