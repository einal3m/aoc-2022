
class Day06
  class << self
    def call(input, no_of_chars)
      queue = (0..(no_of_chars-1)).each_with_index.map { |i| input[i] }

      ((no_of_chars)..input.length).each_with_index do |i|
        if Set.new(queue).length == no_of_chars
          return i
        end

        queue.shift
        queue.push(input[i])
      end
    end
  end
end
