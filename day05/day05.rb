class Day05
  class << self
    def part1(stacks, input)
      input.each do |line|
        if /^move (\d+) from (\d+) to (\d+)$/ =~ line
          $1.to_i.times do |i|
            stacks[$3.to_i-1].push(stacks[$2.to_i-1].pop)
          end
        end
      end

      stacks.map{|stack| stack.pop}.join
    end

    def part2(stacks, input)
      input.each do |line|
        if /^move (\d+) from (\d+) to (\d+)$/ =~ line
          tmp_stack = []

          $1.to_i.times do |i|
            tmp_stack.push(stacks[$2.to_i-1].pop)
          end

          $1.to_i.times do |i|
            stacks[$3.to_i-1].push(tmp_stack.pop)
          end
        end
      end

      stacks.map{|stack| stack.pop}.join()
    end
  end
end
