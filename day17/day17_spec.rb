require_relative 'day17'
require_relative '../spec/spec_helper'

RSpec.describe Day17 do
  let(:example_input) { ">>><<><>><<<>><>>><<<>>><<<><<<>><>><<>>" }

  describe "Part One" do
    context 'examples' do
      it 'matches example result' do
        expect(Day17.part1(example_input, 2022)).to eq(3068)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s }[0] }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 17 Part One:'
        puts Day17.part1(input, 2022)
        puts '--------------------------'
      end
    end
  end

  describe "Part Two" do
    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s }[0] }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 17 Part Two:'
        puts Day17.part1(input, 20000)
        puts '--------------------------'
      end
    end
  end
end
