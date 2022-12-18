class Day17
  class << self

    # Each rock appears so that its left edge is two units away from the left wall and its bottom edge 
    # is three units above the highest rock in the room (or the floor, if there isn't one).
    BLOCKS = [
      [{x: 0, y: 0}, {x: 1, y: 0}, {x: 2, y: 0}, {x: 3, y: 0}], # -
      [{x: 1, y: 0}, {x: 0, y: 1}, {x: 1, y: 1}, {x: 2, y: 1}, {x: 1, y: 2}], # +
      [{x: 0, y: 0}, {x: 1, y: 0}, {x: 2, y: 0}, {x: 2, y: 1}, {x: 2, y: 2}], # L
      [{x: 0, y: 0}, {x: 0, y: 1}, {x: 0, y: 2}, {x: 0, y: 3}], # I
      [{x: 0, y: 0}, {x: 1, y: 0}, {x: 0, y: 1}, {x: 1, y: 1}] # o
    ]

    def part1(input, block_count)
      # file = File.open("max_blocks.csv", "a")

      directions = parse(input)
      max_block = -1
      direction_i = 0

      grid = {}

      block_count.times.each_with_index do |i|
        if (i > 99) && (i % 100 == 0)
          grid = purge(grid, max_block)
        end

        block_x = 2
        block_y = max_block + 4
        block = BLOCKS[i % 5]

        loop do
          if directions[direction_i] == :left
            if can_move_left?(block, block_x, block_y, grid)
              block_x -= 1
            end
          else
            if can_move_right?(block, block_x, block_y, grid)
              block_x += 1
            end
          end
          direction_i = (direction_i + 1) % directions.count

          if can_move_down?(block, block_x, block_y, grid) 
            block_y -= 1
          else
            break
          end
        end

        grid = add_block_to_grid(block, block_x, block_y, grid)

        if block.last[:y]+block_y > max_block
          # file.puts (block.last[:y]+block_y - max_block)
          max_block = block.last[:y]+block_y
        # else
          # file.puts "0"
        end
      end

      # file.close

      max_block+1
    end

    private

    def parse(input) 
      input.each_char.map do |char|
        char == "<" ? :left : :right
      end
    end

    def position(x, y)
      [x,y]
    end

    def can_move_down?(block, block_x, block_y, grid)
      block.all? do |point|
        (point[:y]+block_y > 0) && grid[position(point[:x]+block_x, point[:y]+block_y-1)].nil? 
      end
    end

    def can_move_left?(block, block_x, block_y, grid)
      block.all? do |point|
        (point[:x]+block_x > 0) && grid[position(point[:x]+block_x-1, point[:y]+block_y)].nil? 
      end
    end

    def can_move_right?(block, block_x, block_y, grid)
      block.all? do |point|
        (point[:x]+block_x < 6) && grid[position(point[:x]+block_x+1, point[:y]+block_y)].nil? 
      end
    end

    def add_block_to_grid(block, block_x, block_y, grid)
      block.each do |point|
        grid[position(point[:x]+block_x, point[:y]+block_y)] = :block
      end

      grid
    end

    def purge(grid, max_block)
      grid.delete_if { |key, _| key[1] < max_block - 100 }
    end

    def print(grid, falling_block, block_x, block_y, max_block)
      ((max_block+6).downto(0)).each_with_index do |y|
        row = "|"
        (0..6).each_with_index do |x|
          char = grid[position(x,y)]
          point = if falling_block.any?{|point| point[:x]+block_x == x && point[:y]+block_y == y }
            "@"
          elsif char == :block
            "#"
          else 
            "."
          end
          row += point
        end
        puts row + "|"
      end
      puts "+-------+"
    end
  end
end
