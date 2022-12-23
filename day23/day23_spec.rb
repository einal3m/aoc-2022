require_relative 'day23'
require_relative '../spec/spec_helper'

RSpec.describe Day23 do
  let(:example_input) do
    [ 
      '....#..',
      '..###.#',
      '#...#.#',
      '.#...##',
      '#.###..',
      '##.#.##',
      '.#..#..',
    ] 
  end

  describe "Part One" do
    context 'examples' do
      it 'matches example result' do
        expect(Day23.part1(example_input)).to eq(110)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 23 Part One:'
        puts Day23.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe "Part Two" do
    context 'examples' do
      it 'matches example result' do
        expect(Day23.part2(example_input)).to eq(20)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 23 Part Two:'
        puts Day23.part2(input)
        puts '--------------------------'
      end
    end
  end
end
