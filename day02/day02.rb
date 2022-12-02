class Day02
  class << self
    def part1(input)
      scores = {
        'A X' => 4, # rock (A) vs rock (1) draw (3)
        'A Y' => 8, # rock (A) vs paper (2) win (6)
        'A Z' => 3, # rock (A) vs scissors (3) lose (0)
        'B X' => 1, # paper (B) vs rock (1) lose (0)
        'B Y' => 5, # paper (B) vs paper (2) draw (3)
        'B Z' => 9, # paper (B) vs scissors (3) win (6)
        'C X' => 7, # scissors (C) vs rock (1) win (6)
        'C Y' => 2, # scissors (C) vs paper (2) lose (0)
        'C Z' => 6  # scissors (C) vs scissors (3) draw (3)
      }

      input.map{|row| scores[row]}.sum
    end

    def part2(input)
      scores = {
        'A X' => 3, # rock (A) need to lose (0), choose scissors (3)
        'A Y' => 4, # rock (A) need to draw (3), choose rock (1)
        'A Z' => 8, # rock (A) need to win (6), choose paper (2)
        'B X' => 1, # paper (B) need to lose (0), choose rock (1)
        'B Y' => 5, # paper (B) need to draw (3), choose paper (2)
        'B Z' => 9, # paper (B) need to win (6), choose scissors (3)
        'C X' => 2, # scissors (C) need to lose (0), choose paper (2)
        'C Y' => 6, # scissors (C) need to draw (3), choose scissors (3)
        'C Z' => 7  # scissors (C) need to win (6), choose rock (1)
      }

      input.map{|row| scores[row]}.sum
    end
  end
end
