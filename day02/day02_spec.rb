require_relative 'day02'
require_relative '../spec/spec_helper'

RSpec.describe Day02 do
  describe 'Part One' do
    context 'examples' do
      let(:input) { ['A Y', 'B X', 'C Z'] }

      it 'matches example result' do
        expect(Day02.part1(input)).to eq(15)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 02 Part One:'
        puts Day02.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      let(:input) { ['A Y', 'B X', 'C Z'] }

      it 'matches example result' do
        expect(Day02.part2(input)).to eq(12)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 02 Part Two:'
        puts Day02.part2(input)
        puts '--------------------------'
      end
    end
  end
end
