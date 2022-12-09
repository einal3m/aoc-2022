class Day09
  class << self
    def call(input, no_of_knots)
      visited = {}
      knots_x = Array.new(no_of_knots+1, 0)
      knots_y = Array.new(no_of_knots+1, 0)

      visited["#{knots_x[no_of_knots]}-#{knots_y[no_of_knots]}"] = true
      input.each do |line|
        (direction, count_string) = line.split(" ")

        count_string.to_i.times do
          # move the head
          (knots_x[0], knots_y[0]) = move_head(knots_x[0], knots_y[0], direction)

          # move the tails one at a time
          no_of_knots.times do |i|
            if (knots_y[i+1] == knots_y[i]) && (knots_x[i+1] == knots_x[i])
              # noop
            elsif (knots_y[i+1] - knots_y[i]).abs <= 1 && (knots_x[i+1] - knots_x[i]).abs <= 1
              # noop
            elsif knots_y[i+1] == knots_y[i]
              knots_x[i+1] += (knots_x[i] - knots_x[i+1])/(knots_x[i] - knots_x[i+1]).abs
            elsif knots_x[i+1] == knots_x[i]
              knots_y[i+1] += (knots_y[i] - knots_y[i+1])/(knots_y[i] - knots_y[i+1]).abs
            else
              knots_x[i+1] += (knots_x[i] - knots_x[i+1])/(knots_x[i] - knots_x[i+1]).abs
              knots_y[i+1] += (knots_y[i] - knots_y[i+1])/(knots_y[i] - knots_y[i+1]).abs
            end
          end

          visited["#{knots_x[no_of_knots]}-#{knots_y[no_of_knots]}"] = true
        end
      end

      visited.keys.count
    end

    private

    def move_head(head_x, head_y, direction)
      case direction
      when "R"
        head_x += 1
      when "L"
        head_x -= 1
      when "U"
        head_y += 1
      else
        head_y -= 1
      end

      [head_x, head_y]
    end
  end
end
