class Day04
  class << self
    def part1(input)
      input.map do |line|
        elves = elf_sections(line)
        ((elves[0] - elves[1]).empty?) || ((elves[1] - elves[0]).empty?) ? 1 : 0
      end.sum
    end

    def part2(input)
      input.map do |line|
        elves = elf_sections(line)
        (elves[0] & elves[1]).empty? ? 0 : 1
      end.sum
    end

    private

    def elf_sections(line)
      line
        .split(",")
        .map do |elf|
          (elf1, elf2) = elf.split("-")
          (elf1..elf2).to_a
        end
    end
  end
end
