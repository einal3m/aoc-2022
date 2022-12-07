require_relative 'day05'
require_relative '../spec/spec_helper'

RSpec.describe Day05 do
  describe 'Part One' do
    context 'examples' do
      let(:input) do
        [
          "move 1 from 2 to 1",
          "move 3 from 1 to 3",
          "move 2 from 2 to 1",
          "move 1 from 1 to 2"
        ]
      end

      it 'matches example result' do
        stacks = [
          ["Z", "N"],
          ["M", "C", "D"],
          ["P"]
        ]
        expect(Day05.part1(stacks, input)).to eq("CMZ")
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        stacks = [
          ["N", "R", "G", "P"],
          ["J", "T", "B", "L", "F", "G", "D", "C"],
          ["M", "S", "V"],
          ["L", "S", "R", "C", "Z", "P"],
          ["P", "S", "L", "V", "C", "W", "D", "Q"],
          ["C", "T", "N", "W", "D", "M", "S"],
          ["H", "D", "G", "W", "P"],
          ["Z", "L", "P", "H", "S", "C", "M", "V"],
          ["R", "P", "F", "L", "W", "G", "Z"]
        ]

        puts ''
        puts '--------------------------'
        puts 'Answer to Day 05 Part One:'
        puts Day05.part1(stacks, input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      let(:input) do
        [
          "move 1 from 2 to 1",
          "move 3 from 1 to 3",
          "move 2 from 2 to 1",
          "move 1 from 1 to 2"
        ]
      end

      it 'matches example result' do
        stacks = [
          ["Z", "N"],
          ["M", "C", "D"],
          ["P"]
        ]
        expect(Day05.part2(stacks, input)).to eq("MCD")
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        stacks = [
          ["N", "R", "G", "P"],
          ["J", "T", "B", "L", "F", "G", "D", "C"],
          ["M", "S", "V"],
          ["L", "S", "R", "C", "Z", "P"],
          ["P", "S", "L", "V", "C", "W", "D", "Q"],
          ["C", "T", "N", "W", "D", "M", "S"],
          ["H", "D", "G", "W", "P"],
          ["Z", "L", "P", "H", "S", "C", "M", "V"],
          ["R", "P", "F", "L", "W", "G", "Z"]
        ]

        puts ''
        puts '--------------------------'
        puts 'Answer to Day 05 Part Two:'
        puts Day05.part2(stacks, input)
        puts '--------------------------'
      end
    end
  end
end
