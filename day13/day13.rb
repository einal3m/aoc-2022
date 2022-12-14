class Day13
  class << self
    def part1(input)
      pairs = parse(input)
      correct_pair_indices = []

      pairs.each_with_index do |pair, pair_index|
        result = compare(pair[:left], pair[:right])
        correct_pair_indices << (pair_index+1) if result == :correct
      end

      correct_pair_indices.sum
    end

    def part2(input)
      divider1 = [[2]]
      divider2 = [[6]]
      groups = input.reject(&:empty?).map{|line| eval(line)} + [divider1] + [divider2]

      groups.sort! do |a,b|
        compare(a, b) == :correct ? -1 : 1
      end

      (groups.find_index(divider1) + 1) * (groups.find_index(divider2) + 1)
    end

    private

    def compare(left_array, right_array)
      i = 0
      loop do
        left_el = left_array[i]
        right_el = right_array[i]

        # both are nil
        if left_el.nil? && right_el.nil?
          return :none

        # left el is empty
        elsif left_el.nil?
          return :correct

        # right el is empty
        elsif right_el.nil?
          return :incorrect

        # both items are equal
        elsif left_el == right_el
          i += 1

        # both are arrays
        elsif left_el.is_a?(Array) && right_el.is_a?(Array)
          return compare(left_el, right_el)

        # left is array
        elsif left_el.is_a?(Array)
          result = compare(left_el, [right_el])
          if result == :none
            i += 1
          else
            return result
          end

        # right is array
        elsif right_el.is_a?(Array)
          result = compare([left_el], right_el)
          if result == :none
            i += 1
          else
            return result
          end

        elsif left_el < right_el
          return :correct

        elsif left_el > right_el
          return :incorrect
        end
      end
    end

    def parse(input)
      input.chunk(&:empty?).reject(&:first).map(&:last).map{|group| {left: eval(group[0]), right: eval(group[1])}}
    end
  end
end
