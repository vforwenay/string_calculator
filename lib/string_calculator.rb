class StringCalculator
  def add(numbers)
    return 0 unless numbers.is_a?(String)

    delimiter = ','
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
    end

    numbers_array = numbers.split(/[,#{delimiter}\n]/).map(&:to_i)
    negatives = numbers_array.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers_array.sum
  end
end
