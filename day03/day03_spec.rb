require_relative 'day03'
require_relative '../spec/spec_helper'

RSpec.describe Day03 do
  describe 'Part One' do
    context 'examples' do
      let(:input) do
        [
          "vJrwpWtwJgWrhcsFMMfFFhFp",
          "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
          "PmmdzqPrVvPwwTWBwg",
          "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
          "ttgJtRGJQctTZtZT",
          "CrZsJsPPZsGzwwsLwLmpwMDw"
        ]
      end

      it 'matches example result' do
        expect(Day03.part1(input)).to eq(157)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 03 Part One:'
        puts Day03.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      let(:input) do
        [
          "vJrwpWtwJgWrhcsFMMfFFhFp",
          "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
          "PmmdzqPrVvPwwTWBwg",
          "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
          "ttgJtRGJQctTZtZT",
          "CrZsJsPPZsGzwwsLwLmpwMDw"
        ]
      end

      it 'matches example result' do
        expect(Day03.part2(input)).to eq(70)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 03 Part Two:'
        puts Day03.part2(input)
        puts '--------------------------'
      end
    end
  end
end
