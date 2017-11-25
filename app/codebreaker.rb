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

      contains = false
      input.each_char do |digit|
        if @secret_number.include?(digit)
          contains = true
        end
      end

      exact_match = false
      input.chars.each_with_index do |input_value, input_index|
        @secret_number.chars.each_with_index do |secret_number_value, secret_number_index|
          if input_value == secret_number_value && input_index == secret_number_index
            exact_match = true
          end
        end
      end

      if exact_match
        output.puts "+"
      elsif contains
        output.puts "-"
      else
        output.puts ''
      end

    end
  end
end
