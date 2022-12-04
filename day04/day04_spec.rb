require_relative 'day04'
require_relative '../spec/spec_helper'

RSpec.describe Day04 do
  describe 'Part One' do
    context 'examples' do
      let(:input) do
        [
          "2-4,6-8",
          "2-3,4-5",
          "5-7,7-9",
          "2-8,3-7",
          "6-6,4-6",
          "2-6,4-8"
        ]
      end

      it 'matches example result' do
        expect(Day04.part1(input)).to eq(2)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 04 Part One:'
        puts Day04.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      let(:input) do
        [
          "2-4,6-8",
          "2-3,4-5",
          "5-7,7-9",
          "2-8,3-7",
          "6-6,4-6",
          "2-6,4-8"
        ]
      end

      it 'matches example result' do
        expect(Day04.part2(input)).to eq(4)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 04 Part Two:'
        puts Day04.part2(input)
        puts '--------------------------'
      end
    end
  end
end
