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
    delimiter = numbers[/^\/\/(.*?)\n/, 1] || ','
    [delimiter, numbers.sub(/^\/\/.*?\n/, '')]
  end

  def parse_numbers(numbers, delimiter)
    numbers.split(delimiter_regexp(delimiter)).map(&:to_i)
  end

  def delimiter_regexp(delimiter)
    /[,#{Regexp.escape(delimiter)}\n]/
  end

  def check_negatives(numbers_array)
    negatives = numbers_array.select(&:negative?)
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
