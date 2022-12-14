require_relative 'day12'
require_relative '../spec/spec_helper'

RSpec.describe Day12 do
  let(:example_input) do 
    [
      'Sabqponm',
      'abcryxxl',
      'accszExk',
      'acctuvwj',
      'abdefghi'
    ]
  end

  describe "Part One" do
    context 'examples' do
      it 'matches example result' do
        expect(Day12.part1(example_input)).to eq(31)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 12 Part One:'
        puts Day12.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe "Part Two" do
    context 'examples' do
      it 'matches example result' do
        expect(Day12.part2(example_input)).to eq(29)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 12 Part Two:'
        puts Day12.part2(input)
        puts '--------------------------'
      end
    end
  end
end
