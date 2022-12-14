class Day12
  class << self
    def part1(input)
      grid, start_index, end_index = parse(input)
      height = input.length
      width = input[0].length

      adjusted = true
      while adjusted do
        grid, adjusted = process_path_up(grid, start_index, width, height)
      end

      grid[position(end_index[:x], end_index[:y])][:cost]
    end

    def part2(input)
      grid, start_index, end_index = parse(input)
      height = input.length
      width = input[0].length

      adjusted = true
      while adjusted do
        grid, adjusted = process_path_down(grid, end_index, width, height)
      end

      grid.values.filter{|point| point[:height] == 1}.map{|point| point[:cost] || 100000000000}.min
    end

    private

    def print_char(grid, x, y, start_index, end_index)
      if start_index[:x] == x && start_index[:y] == y
        "S"
      elsif end_index[:x] == x && end_index[:y] == y
        "E"
      else
        grid[position(x,y)][:cost] || "_" 
      end
    end

    def position(x, y)
      "(#{x},#{y})"
    end

    def process_path_up(grid, start_index, width, height)
      adjusted = false

      width.times.each_with_index do |x|
        height.times.each_with_index do |y|
          current_pos = position(x,y)
          current_height = grid[current_pos][:height]

          if start_index[:x] == x && start_index[:y] == y
            grid[current_pos][:cost] = 0
          end

          current_cost = grid[current_pos][:cost]
          next if current_cost.nil?

          grid[current_pos][:visited] = true

          # north (y-1)
          north_pos = position(x, y-1)
          north_val = grid[north_pos]
          if north_val != nil && !north_val[:visited] && (north_val[:height] <= current_height + 1)
            north_cost = grid[north_pos][:cost]
            if north_cost.nil? || north_cost > current_cost
              grid[north_pos][:cost] = current_cost + 1
              adjusted = true
            end
          end

          # south (y+1)
          south_pos = position(x, y+1)
          south_val = grid[south_pos]
          if south_val != nil && !south_val[:visited] && (south_val[:height] <= current_height + 1)
            south_cost = grid[south_pos][:cost]
            if south_cost.nil? || south_cost > current_cost
              grid[south_pos][:cost] = current_cost + 1
              adjusted = true
            end
          end

          # east (x+1)
          east_pos = position(x+1, y)
          east_val = grid[east_pos]
          if east_val != nil && !east_val[:visited] && (east_val[:height] <= current_height + 1)
            east_cost = grid[east_pos][:cost]
            if east_cost.nil? || east_cost > current_cost
              grid[east_pos][:cost] = current_cost + 1
              adjusted = true
            end
          end

          # west (x-1)
          west_pos = position(x-1, y)
          west_val = grid[west_pos]
          if west_val != nil && !west_val[:visited] && (west_val[:height] <= current_height + 1)
            west_cost = grid[west_pos][:cost]
            if west_cost.nil? || west_cost > current_cost
              grid[west_pos][:cost] = current_cost + 1
              adjusted = true
            end
          end
        end
      end

      [grid, adjusted]
    end

    def process_path_down(grid, start_index, width, height)
      adjusted = false

      width.times.each_with_index do |x|
        height.times.each_with_index do |y|
          current_pos = position(x,y)
          current_height = grid[current_pos][:height]

          if start_index[:x] == x && start_index[:y] == y
            grid[current_pos][:cost] = 0
          end

          current_cost = grid[current_pos][:cost]
          next if current_cost.nil?

          grid[current_pos][:visited] = true

          # north (y-1)
          north_pos = position(x, y-1)
          north_val = grid[north_pos]
          if north_val != nil && !north_val[:visited] && (north_val[:height] >= current_height - 1)
            north_cost = grid[north_pos][:cost]
            if north_cost.nil? || north_cost > current_cost
              grid[north_pos][:cost] = current_cost + 1
              adjusted = true
            end
          end

          # south (y+1)
          south_pos = position(x, y+1)
          south_val = grid[south_pos]
          if south_val != nil && !south_val[:visited] && (south_val[:height] >= current_height - 1)
            south_cost = grid[south_pos][:cost]
            if south_cost.nil? || south_cost > current_cost
              grid[south_pos][:cost] = current_cost + 1
              adjusted = true
            end
          end

          # east (x+1)
          east_pos = position(x+1, y)
          east_val = grid[east_pos]
          if east_val != nil && !east_val[:visited] && (east_val[:height] >= current_height - 1)
            east_cost = grid[east_pos][:cost]
            if east_cost.nil? || east_cost > current_cost
              grid[east_pos][:cost] = current_cost + 1
              adjusted = true
            end
          end

          # west (x-1)
          west_pos = position(x-1, y)
          west_val = grid[west_pos]
          if west_val != nil && !west_val[:visited] && (west_val[:height] >= current_height - 1)
            west_cost = grid[west_pos][:cost]
            if west_cost.nil? || west_cost > current_cost
              grid[west_pos][:cost] = current_cost + 1
              adjusted = true
            end
          end
        end
      end

      [grid, adjusted]
    end    

    def parse(input) 
      grid = {}
      start_index = {}
      end_index = {}
      input.each_with_index do |row, y|
        row.each_byte.each_with_index do |col, x|

          if col == 83
            start_index[:x] = x
            start_index[:y] = y
            col = 97
          end

          if col == 69
            end_index[:x] = x
            end_index[:y] = y
            col = 122
          end
          grid[position(x, y)] = {
            height: col - 96,
            visited: false
          }
        end
      end

      [grid, start_index, end_index]
    end
  end
end
