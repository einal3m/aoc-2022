class Day11
  class << self

    def part1(input)
      (monkeys, monkey_items, all_multiples) = parse_input(input)

      monkey_counts = {}

      20.times do 
        monkeys.each do |monkey|
          monkey_items[monkey[:id]].count.times do 
            monkey_counts[monkey[:id]] = (monkey_counts[monkey[:id]] || 0) + 1
            item = monkey_items[monkey[:id]].shift
            case monkey[:op]
            when :times
              item = item * monkey[:op_val]
            when :plus
              item += monkey[:op_val]
            when :squared
              item = item * item
            end

            item = item.div(3)

            true_or_false = item % monkey[:test] == 0 ? :true : :false
            monkey_items[monkey[true_or_false]] = (monkey_items[monkey[true_or_false]] || []).push(item)
          end
        end
      end

      monkey_counts = monkey_counts.values.sort.reverse
      monkey_counts[0] * monkey_counts[1]
    end

    def part2(input)
      (monkeys, monkey_items, all_multiples) = parse_input(input)

      monkey_counts = {}

      10000.times do 
        monkeys.each do |monkey|
          monkey_items[monkey[:id]].count.times do 
            monkey_counts[monkey[:id]] = (monkey_counts[monkey[:id]] || 0) + 1
            item = monkey_items[monkey[:id]].shift
            case monkey[:op]
            when :times
              item = item * monkey[:op_val]
            when :plus
              item += monkey[:op_val]
            when :squared
              item = item * item
            end

            item = item % all_multiples

            true_or_false = item % monkey[:test] == 0 ? :true : :false
            monkey_items[monkey[true_or_false]] = (monkey_items[monkey[true_or_false]] || []).push(item)
          end
        end
      end

      monkey_counts = monkey_counts.values.sort.reverse
      monkey_counts[0] * monkey_counts[1]
    end

    private

    def parse_input(input)
      all_multiples = 1
      monkeys = []
      monkey_items = {}
      monkey_i = 0
      monkey = {}

      input.each do |line|
        if line == ''
          monkeys << monkey
        elsif /^Monkey (\d):$/ =~ line
          monkey_i = $1.to_i
          monkey = {id: monkey_i}
        elsif /^  Starting items: (.+)$/ =~ line
          monkey_items[monkey_i] = $1.split(",").map(&:to_i)
        elsif line == "  Operation: new = old * old"
          monkey[:op] = :squared
        elsif /^  Operation: new = old \+ (.+)$/ =~ line
          monkey[:op] = :plus
          monkey[:op_val] = $1.to_i
        elsif /^  Operation: new = old \* (.+)$/ =~ line
          monkey[:op] = :times
          monkey[:op_val] = $1.to_i
        elsif /^  Test: divisible by (\d+)$/ =~ line
          monkey[:test] = $1.to_i
          all_multiples = all_multiples * monkey[:test]
        elsif /^    If true: throw to monkey (\d+)$/ =~ line
          monkey[:true] = $1.to_i
        elsif /^    If false: throw to monkey (\d+)$/ =~ line
          monkey[:false] = $1.to_i
        end
      end
      monkeys << monkey

      [monkeys, monkey_items, all_multiples]
    end
  end
end
