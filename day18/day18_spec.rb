require_relative 'day18'
require_relative '../spec/spec_helper'

RSpec.describe Day18 do
  let(:example_input_1) do
     [
      '1,1,1', 
      '2,1,1'
    ]
  end

  let(:example_input_2) do
     [
      '2,2,2',
      '1,2,2',
      '3,2,2',
      '2,1,2',
      '2,3,2',
      '2,2,1',
      '2,2,3',
      '2,2,4',
      '2,2,6',
      '1,2,5',
      '3,2,5',
      '2,1,5',
      '2,3,5'
    ]
  end

  describe "Part One" do
    context 'examples' do
      it 'matches example result' do
        expect(Day18.part1(example_input_1)).to eq(10)
        expect(Day18.part1(example_input_2)).to eq(64)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 18 Part One:'
        puts Day18.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe "Part Two" do
    context 'examples' do
      it 'matches example result' do
        expect(Day18.part2(example_input_2)).to eq(58)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 18 Part Two:'
        puts Day18.part2(input)
        puts '--------------------------'
      end
    end
  end
end
