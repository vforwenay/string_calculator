class StringCalculator
  def add(numbers)
    return 0 unless numbers.is_a?(String)

    delimiter = ','
    if numbers.start_with?("//")
      delimiter_end = numbers.index("\n")
      delimiter = numbers[2...delimiter_end]
      numbers = numbers[(delimiter_end + 1)..-1]
    end

    numbers_array = numbers.split(/[,#{Regexp.escape(delimiter)}\n]/).map(&:to_i)
    negatives = numbers_array.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers_array.reject! { |num| num > 1000 }
    numbers_array.sum
  end
end
