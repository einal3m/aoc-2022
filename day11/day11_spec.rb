require_relative 'day11'
require_relative '../spec/spec_helper'

RSpec.describe Day11 do
  let(:input) do
    [
      'Monkey 0:',
      '  Starting items: 79, 98',
      '  Operation: new = old * 19',
      '  Test: divisible by 23',
      '    If true: throw to monkey 2',
      '    If false: throw to monkey 3',
      '',
      'Monkey 1:',
      '  Starting items: 54, 65, 75, 74',
      '  Operation: new = old + 6',
      '  Test: divisible by 19',
      '    If true: throw to monkey 2',
      '    If false: throw to monkey 0',
      '',
      'Monkey 2:',
      '  Starting items: 79, 60, 97',
      '  Operation: new = old * old',
      '  Test: divisible by 13',
      '    If true: throw to monkey 1',
      '    If false: throw to monkey 3',
      '',
      'Monkey 3:',
      '  Starting items: 74',
      '  Operation: new = old + 3',
      '  Test: divisible by 17',
      '    If true: throw to monkey 0',
      '    If false: throw to monkey 1'
    ]
  end

  describe 'Part One' do
    context 'examples' do
      it 'matches example result' do
        expect(Day11.part1(input)).to eq(10605)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 11 Part One:'
        puts Day11.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      it 'matches example result' do
        expect(Day11.part2(input)).to eq(2713310158)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 11 Part Two:'
        puts Day11.part2(input)
        puts '--------------------------'
      end
    end
  end
end
