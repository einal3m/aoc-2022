require_relative 'day09'
require_relative '../spec/spec_helper'

RSpec.describe Day09 do
  describe 'Part One' do
    context 'examples' do
      let(:input) do
        [
          'R 4',
          'U 4',
          'L 3',
          'D 1',
          'R 4',
          'D 1',
          'L 5',
          'R 2'
        ]
      end

      it 'matches example result' do
        expect(Day09.call(input, 1)).to eq(13)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 09 Part One:'
        puts Day09.call(input, 1)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      let(:input1) do
        [
          'R 4',
          'U 4',
          'L 3',
          'D 1',
          'R 4',
          'D 1',
          'L 5',
          'R 2'
        ]
      end

      let(:input2) do
        [
        'R 5',
        'U 8',
        'L 8',
        'D 3',
        'R 17',
        'D 10',
        'L 25',
        'U 20'
        ]
      end

      it 'matches example result' do
        # expect(Day09.part2(input1, 10)).to eq(1)
        expect(Day09.call(input2, 9)).to eq(36)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s) }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 09 Part Two:'
        puts Day09.call(input, 9)
        puts '--------------------------'
      end
    end
  end
end
