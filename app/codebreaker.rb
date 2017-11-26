class Codebreaker
  class Game
    attr_reader :output

    def initialize(output)
      @output = output

    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
    end

    def guess(input)
      output.puts "Try guessing a number with four digits" unless input.length == 4

      result = ''
      pluses = ''
      minuses = ''
      matched_numbers = []

      input.chars.each_with_index do |input_value, input_index|
        @secret_number.chars.each_with_index do |secret_number_value, secret_number_index|
          if input_value == secret_number_value
            if input_index == secret_number_index
              pluses += "+"
            else
              if !matched_numbers.include?(input_value)
                minuses += "-"
                matched_numbers << input_value
              end
            end
          end
        end
      end

      result = pluses + minuses
      output.puts(result)

    end
  end
end
