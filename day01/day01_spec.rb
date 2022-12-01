require_relative 'day01'
require_relative '../spec/spec_helper'

RSpec.describe Day01 do
  describe "Part One" do
    context 'examples' do
      let(:input) { ["1000","2000","3000","","4000","","5000","6000","","7000","8000","9000","","10000"] }

      it 'matches example result' do
        expect(Day01.part1(input)).to eq(24000)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 01 Part One:'
        puts Day01.part1(input)
        puts '--------------------------'
      end
    end
  end

  describe "Part Two" do
    context 'examples' do
      let(:input) { ["1000","2000","3000","","4000","","5000","6000","","7000","8000","9000","","10000"] }

      it 'matches example result' do
        expect(Day01.part2(input)).to eq(45000)
      end
    end

    context 'my input' do
      let(:input) { File.readlines( 'input.txt', chomp: true ).map { |x| x.to_s } }
      it 'equals what?' do
        puts ''
        puts '--------------------------'
        puts 'Answer to Day 01 Part Two:'
        puts Day01.part2(input)
        puts '--------------------------'
      end
    end
  end
end
