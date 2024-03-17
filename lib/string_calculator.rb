class StringCalculator
  def add(numbers)
    return 0 unless numbers.is_a?(String)

    delimiter, numbers = extract_delimiter(numbers)

    numbers_array = parse_numbers(numbers, delimiter)

    check_negatives(numbers_array)

    numbers_array.reject! { |num| num > 1000 }
    numbers_array.sum
  end

  private

  def extract_delimiter(numbers)
    delimiter = ','
    if numbers.start_with?("//")
      delimiter_end = numbers.index("\n")
      delimiter = numbers[2...delimiter_end]
      numbers = numbers[(delimiter_end + 1)..-1]
    end
    [delimiter, numbers]
  end

  def parse_numbers(numbers, delimiter)
    numbers.split(/[,#{Regexp.escape(delimiter)}\n]/).map(&:to_i)
  end

  def check_negatives(numbers_array)
    negatives = numbers_array.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
