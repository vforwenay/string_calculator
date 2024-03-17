require_relative '../../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the number for a single number' do
      calculator = StringCalculator.new
      expect(calculator.add('1')).to eq(1)
    end

    it 'returns the sum of two numbers' do
      calculator = StringCalculator.new
      expect(calculator.add('1,2')).to eq(3)
    end

    it 'returns the sum of multiple numbers' do
      calculator = StringCalculator.new
      expect(calculator.add('1,2,3,4,5')).to eq(15)
    end

    it 'returns the sum of multiple numbers with newline separators' do
       calculator = StringCalculator.new
       expect(calculator.add("1\n2,3\n4")).to eq(10)
    end

    it 'supports custom delimiter' do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,3") }.to raise_error("negatives not allowed: -2")
    end

    it 'throws an exception for negative numbers' do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,-3") }.to raise_error("negatives not allowed: -2, -3")
    end

    it 'ignores numbers bigger than 1000' do
      calculator = StringCalculator.new
      expect(calculator.add("2,1001,2000")).to eq(2)
    end

    it 'supports delimiters of any length' do
      calculator = StringCalculator.new
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end
  end
end
