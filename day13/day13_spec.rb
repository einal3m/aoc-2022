require_relative 'day13'
require_relative '../spec/spec_helper'

RSpec.describe Day13 do
  describe 'Part One' do
    context 'examples' do
      let(:input) do
        [
          '[1,1,3,1,1]',
          '[1,1,5,1,1]',
          '',
          '[[1],[2,3,4]]',
          '[[1],4]',
          '',
          '[9]',
          '[[8,7,6]]',
          '',
          '[[4,4],4,4]',
          '[[4,4],4,4,4]',
          '',
          '[7,7,7,7]',
          '[7,7,7]',
          '',
          '[]',
          '[3]',
          '',
          '[[[]]]',
          '[[]]',
          '',
          '[1,[2,[3,[4,[5,6,7]]]],8,9]',
          '[1,[2,[3,[4,[5,6,0]]]],8,9]'
        ]
      end

      it 'matches example result' do
        expect(Day13.part1(input)).to eq(13)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 13 Part One:'
        puts Day13.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      let(:input) do
        [
          '[1,1,3,1,1]',
          '[1,1,5,1,1]',
          '',
          '[[1],[2,3,4]]',
          '[[1],4]',
          '',
          '[9]',
          '[[8,7,6]]',
          '',
          '[[4,4],4,4]',
          '[[4,4],4,4,4]',
          '',
          '[7,7,7,7]',
          '[7,7,7]',
          '',
          '[]',
          '[3]',
          '',
          '[[[]]]',
          '[[]]',
          '',
          '[1,[2,[3,[4,[5,6,7]]]],8,9]',
          '[1,[2,[3,[4,[5,6,0]]]],8,9]'
        ]
      end

      it 'matches example result' do
        expect(Day13.part2(input)).to eq(140)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 13 Part Two:'
        puts Day13.part2(input)
        puts '--------------------------'
      end
    end
  end
end
