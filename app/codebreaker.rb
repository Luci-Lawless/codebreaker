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

      @result = ''
      @pluses = ''
      @minuses = ''
      @matched_numbers = []

      validate_input_length(input)

      input.chars.each_with_index do |input_value, input_index|
        @secret_number.chars.each_with_index do |secret_number_value, secret_number_index|
          if input_value == secret_number_value
            if input_index == secret_number_index
              add_exact_match(input_value)
            else
              add_number_match(input_value)
            end
          end
        end
      end
      display_result
    end

    private

    def validate_input_length(input)
      output.puts "Try guessing a number with four digits" unless input.length == MAX_INPUT_LENGTH
    end

    def add_exact_match(input_value)
      if !match_exists?(input_value)
        @pluses += "+"
        @matched_numbers << input_value
      end
    end

    def add_number_match(input_value)
      if !match_exists?(input_value)
        @minuses += "-"
        @matched_numbers << input_value
      end
    end

    def match_exists?(input_value)
      return @matched_numbers.include?(input_value)
    end

    def display_result
      @result = @pluses + @minuses
      output.puts(@result)
    end

  end
end
