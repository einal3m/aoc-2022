require_relative 'day06'
require_relative '../spec/spec_helper'

RSpec.describe Day06 do
  describe 'Part One' do
    context 'examples' do
      let(:input) {"mjqjpqmgbljsphdztnvjfqwrcgsmlb"}

      it 'matches example result' do
        expect(Day06.call("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 4)).to eq(7)
        expect(Day06.call("bvwbjplbgvbhsrlpgdmjqwftvncz", 4)).to eq(5)
        expect(Day06.call("nppdvjthqldpwncqszvftbrmjlhg", 4)).to eq(6)
        expect(Day06.call("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 4)).to eq(10)
        expect(Day06.call("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 4)).to eq(11)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s)[0] }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 06 Part One:'
        puts Day06.call(input, 4)
        puts '--------------------------'
      end
    end
  end

  describe 'Part Two' do
    context 'examples' do
      it 'matches example result' do
        expect(Day06.call("mjqjpqmgbljsphdztnvjfqwrcgsmlb", 14)).to eq(19)
        expect(Day06.call("bvwbjplbgvbhsrlpgdmjqwftvncz", 14)).to eq(23)
        expect(Day06.call("nppdvjthqldpwncqszvftbrmjlhg", 14)).to eq(23)
        expect(Day06.call("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg", 14)).to eq(29)
        expect(Day06.call("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw", 14)).to eq(26)
      end
    end

    context 'my input' do
      let(:input) { File.readlines('input.txt', chomp: true).map(&:to_s)[0] }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 06 Part Two:'
        puts Day06.call(input, 14)
        puts '--------------------------'
      end
    end
  end
end
