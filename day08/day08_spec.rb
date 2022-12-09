require_relative 'day08'
require_relative '../spec/spec_helper'

RSpec.describe Day08 do
  describe 'Part One' do
    context 'examples' do
      let(:input) do
        [
        '30373',
        '25512',
        '65332',
        '33549',
        '35390'
        ]
      end

      it 'matches example result' do
        expect(Day08.part1(input)).to eq(21)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 08 Part One:'
        puts Day08.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      let(:input) do
        [
          '30373',
          '25512',
          '65332',
          '33549',
          '35390'
        ]
      end

      it 'matches example result' do
        expect(Day08.part2(input)).to eq(8)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 08 Part Two:'
        puts Day08.part2(input)
        puts '--------------------------'
      end
    end
  end
end
