class Day21
  class << self
    def part1(input)
      monkeys = parse(input)
      calculate("root", monkeys)
    end

    def part2(input)
      monkeys = parse(input)

      # these numbers come from manual checking:
      max = 0
      min = 1000000000000000

      100.times do
        new_try = (max + min) / 2
        path1_new, path2 = try_val(monkeys, new_try)

        if path1_new == path2
          return new_try
        elsif path1_new < path2
          min = new_try
        else
          max = new_try
        end
      end

      0
    end

    private

    def try_val(monkeys, val)
      monkeys["humn"] = { op: :eq, val: val }
      [calculate(monkeys["root"][:monkey_1], monkeys), calculate(monkeys["root"][:monkey_2], monkeys)]
    end

    def calculate(monkey_code, monkeys)
      m = monkeys[monkey_code]
      case m[:op]
      when :eq
        return m[:val]
      when :add
        return calculate(m[:monkey_1], monkeys) + calculate(m[:monkey_2], monkeys)
      when :subtract
        return calculate(m[:monkey_1], monkeys) - calculate(m[:monkey_2], monkeys)
      when :multiply
        return calculate(m[:monkey_1], monkeys) * calculate(m[:monkey_2], monkeys)
      when :divide
        return calculate(m[:monkey_1], monkeys) / calculate(m[:monkey_2], monkeys)
      else
        puts "this shouldn't happen"
        return 0
      end
    end

    def parse(input)
      monkeys = {}
      input.each do |line|
        if /^(\w{4}): (\d+)$/ =~ line
          monkeys[$1] = {op: :eq, val: $2.to_i}
        elsif /^(\w{4}): (\w{4}) \+ (\w{4})$/ =~ line
          monkeys[$1] = {op: :add, monkey_1: $2, monkey_2: $3}
        elsif /^(\w{4}): (\w{4}) \* (\w{4})$/ =~ line
          monkeys[$1] = {op: :multiply, monkey_1: $2, monkey_2: $3}
        elsif /^(\w{4}): (\w{4}) - (\w{4})$/ =~ line
          monkeys[$1] = {op: :subtract, monkey_1: $2, monkey_2: $3}
        elsif /^(\w{4}): (\w{4}) \/ (\w{4})$/ =~ line
          monkeys[$1] = {op: :divide, monkey_1: $2, monkey_2: $3}
        end
      end
      monkeys
    end
  end
end
