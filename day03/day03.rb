class Day03
  class << self
    PRIORITIES = ('`'..'z').to_a + ('A'..'Z').to_a

    def part1(input)
      input.map do |rucksacks|
        sacks = rucksacks.chars.each_slice(rucksacks.length/2).to_a
        PRIORITIES.index((sacks[0] & sacks[1]).first)
      end.sum
    end

    def part2(input)
      input.each_slice(3).map do |group|
        PRIORITIES.index((group[0].chars & group[1].chars & group[2].chars).first)
      end.sum
    end
  end
end
