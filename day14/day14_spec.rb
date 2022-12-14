require_relative 'day14'
require_relative '../spec/spec_helper'

RSpec.describe Day14 do
  describe 'Part One' do
    context 'examples' do
      let(:input) do
        [
          '498,4 -> 498,6 -> 496,6',
          '503,4 -> 502,4 -> 502,9 -> 494,9'
        ]
      end

      it 'matches example result' do
        expect(Day14.part1(input)).to eq(24)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 14 Part One:'
        puts Day14.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      let(:input) do
        [
          '498,4 -> 498,6 -> 496,6',
          '503,4 -> 502,4 -> 502,9 -> 494,9'
        ]
      end

      it 'matches example result' do
        expect(Day14.part2(input)).to eq(93)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 14 Part Two:'
        puts Day14.part2(input)
        puts '--------------------------'
      end
    end
  end
end
