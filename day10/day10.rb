class Day10
  class << self
    CYCLE_POINTS = [20, 60, 100, 140, 180, 220]

    def part1(input)
      register = 1
      cycle = 1
      signal_strengths = 0

      input.each do |line|
        if line == "noop"
          if CYCLE_POINTS.include?(cycle)
            signal_strengths += cycle * register
          end
          cycle += 1
        elsif
          bits = line.split(" ")
          if CYCLE_POINTS.include?(cycle)
            signal_strengths += cycle * register
          end
          cycle += 1
          if CYCLE_POINTS.include?(cycle)
            signal_strengths += cycle * register
          end
          cycle += 1
          register += bits[1].to_i
        end
      end

      signal_strengths
    end

    def part2(input)
      register = 1
      crt_index = 0
      crt_output = []

      input.each do |line|
        if line == "noop"
          crt_output << print_crt(crt_index, register)
          crt_index = tick(crt_index)
        elsif
          bits = line.split(" ")

          crt_output << print_crt(crt_index, register)
          crt_index = tick(crt_index)
          crt_output << print_crt(crt_index, register)
          crt_index = tick(crt_index)

          register += bits[1].to_i
        end
      end

      crt_output.each_slice(40).map(&:join)
    end

    private

    def print_crt(crt_index, register)
      ((crt_index - register).abs <= 1) ? "#" : "."
    end

    def tick(crt_index)
      (crt_index + 1) % 40
    end
  end
end
