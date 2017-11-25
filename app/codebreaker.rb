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
        if (@secret_number.include?(digit))
          contains = true
        end
      end

      output.puts '' unless contains
      else
        output.puts "-"
      end
  end
end
