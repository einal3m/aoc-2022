class Day14
  class << self
    def part1(input)
      grid, min, max = parse(input)
      max_y = max[:y]

      sand_count = 0
      more_sand = true
      while more_sand do
        sand = {x: 500, y: 0}
        falling = true
        while falling do
          if grid[position(sand[:x], sand[:y]+1)].nil?
            sand[:y] += 1
          elsif grid[position(sand[:x]-1, sand[:y]+1)].nil?
            sand[:x] -= 1
            sand[:y] += 1
          elsif grid[position(sand[:x]+1, sand[:y]+1)].nil?
            sand[:x] += 1
            sand[:y] += 1
          else
            grid[position(sand[:x], sand[:y])] = :sand
            sand_count += 1
            falling = false
          end

          if sand[:y] == max_y
            falling = false
            more_sand = false
          end
        end
      end

      sand_count
    end

    def part2(input)
      grid, min, max = parse(input)

      # add in floor
      (-10000..10000).to_a.each{|i| grid[position(i, max[:y]+2)] = :rock }
      max[:y] += 2

      sand_count = 0
      more_sand = true
      while more_sand do
        sand = {x: 500, y: 0}
        falling = true
        while falling do
          if grid[position(sand[:x], sand[:y]+1)].nil?
            sand[:y] += 1
          elsif grid[position(sand[:x]-1, sand[:y]+1)].nil?
            sand[:x] -= 1
            sand[:y] += 1
          elsif grid[position(sand[:x]+1, sand[:y]+1)].nil?
            sand[:x] += 1
            sand[:y] += 1
          else
            grid[position(sand[:x], sand[:y])] = :sand
            sand_count += 1
            falling = false
          end

          if sand[:y] == 0 && sand[:x] == 500
            falling = false
            more_sand = false
          end
        end
      end

      sand_count
    end

    private

    def parse(input)
      max = {x: 500, y: 0}
      min = {x: 500, y: 0}
      rocks = {}
      lines = input.map do |line|
        line.split(" -> ").map{|coord| coord.split(",").map(&:to_i)}.map do |bits|
          if bits[0] < min[:x]
            min[:x] = bits[0]
          end
          if bits[0] > max[:x]
            max[:x] = bits[0]
          end
          if bits[1] < min[:y]
            min[:y] = bits[1]
          end
          if bits[1] > max[:y]
            max[:y] = bits[1]
          end

          {x: bits[0], y: bits[1]}
        end
      end

      lines.each do |line|
        (line.count-1).times.each_with_index do |i|
          from = line[i]
          to = line[i+1]

          range(from[:y], to[:y]).each_with_index do |y|
            range(from[:x], to[:x]).each_with_index do |x|
              rocks[position(x,y)] = :rock
            end
          end
        end
      end

      [rocks, min, max]
    end

    def print(grid, min, max)
      ((min[:y])..(max[:y])).each_with_index do |y|
        row = ""
        ((min[:x])..(max[:x])).each_with_index do |x|
          char = case grid[position(x,y)]
          when :rock
            "#"
          when :sand
            "o"
          else
            "."
           end
          row += char
        end
        puts row
      end
    end

    def range(from, to)
      if from > to
        (to..from).to_a
      else
        (from..to).to_a
      end
    end

    def position(x, y)
      "(#{x}, #{y})"
    end
  end
end
