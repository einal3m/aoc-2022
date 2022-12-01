class Day01
  class << self
    def part1(input)
      input
        .chunk(&:empty?)
        .reject(&:first)
        .map{|_, calorie_group| calorie_group.map(&:to_i).sum }
        .sort[-1]
    end

    def part2(input)
      input
        .chunk(&:empty?)
        .reject(&:first)
        .map{|_, calorie_group| calorie_group.map(&:to_i).sum }
        .sort[-3..-1]
        .sum
    end
  end
end
