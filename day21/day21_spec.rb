require_relative 'day21'
require_relative '../spec/spec_helper'

RSpec.describe Day21 do
  let(:example_input) do
    [
      'root: pppw + sjmn',
      'dbpl: 5',
      'cczh: sllz + lgvd',
      'zczc: 2',
      'ptdq: humn - dvpt',
      'dvpt: 3',
      'lfqf: 4',
      'humn: 5',
      'ljgn: 2',
      'sjmn: drzm * dbpl',
      'sllz: 4',
      'pppw: cczh / lfqf',
      'lgvd: ljgn * ptdq',
      'drzm: hmdt - zczc',
      'hmdt: 32'
    ]
  end

  describe 'Part One' do
    context 'examples' do
      it 'matches example result' do
        expect(Day21.part1(example_input)).to eq(152)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 21 Part One:'
        puts Day21.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 21 Part Two:'
        puts Day21.part2(input)
        puts '--------------------------'
      end
    end
  end
end
