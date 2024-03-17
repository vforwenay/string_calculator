class StringCalculator
  def add(numbers)
    return 0 unless numbers.is_a?(String)

    delimiter = ','

    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
    end

    numbers.split(/[,#{delimiter}\n]/).map(&:to_i).sum
  end
end
