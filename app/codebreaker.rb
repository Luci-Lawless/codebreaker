class Codebreaker
  class Game
    attr_reader :output
    MAX_INPUT_LENGTH = 4

    def initialize(output)
      @output = output

    end

    def start(secret_number)
      @secret_number = secret_number

      output.puts "Welcome to Codebreaker"
      output.puts "Enter guess:"
    end

    def guess(input)

      validate_input_length(input)

      result = ''
      pluses = ''
      minuses = ''
      matched_numbers = []

      input.chars.each_with_index do |input_value, input_index|
        @secret_number.chars.each_with_index do |secret_number_value, secret_number_index|
          if input_value == secret_number_value
            if input_index == secret_number_index
              if !matched_numbers.include?(input_value)
                pluses += "+"
                matched_numbers << input_value
              end
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
    
    private

    def validate_input_length(input)
      output.puts "Try guessing a number with four digits" unless input.length == MAX_INPUT_LENGTH
    end

  end
end
