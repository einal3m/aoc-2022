class Day08
  class << self
    def part1(input)
      height = input.length
      width = input[0].length
      trees = parse(input)

      has_view_count = 0
      trees.each_with_index do |row, y|
        row.each_with_index do |tree, x|
          if x == 0 || y == 0 || x == width-1 || y == height-1 || has_view?(x, y, tree, trees, width, height)
            has_view_count += 1
          end
        end
      end
        
      has_view_count
    end

    def part2(input)
      height = input.length
      width = input[0].length
      trees = parse(input)

      score = 0
      trees.each_with_index do |row, y|
        row.each_with_index do |tree, x|
          if x == 0 || y == 0 || x == width-1 || y == height-1
            next
          end

          tree_score = scenic_score(x, y, tree, trees, width, height)

          if tree_score > score
            score = tree_score
          end
        end
      end

      score
    end

    private

    def parse(input)
      input.map do |line|
        line.chars.map(&:to_i)
      end
    end

    def scenic_score(tree_x, tree_y, tree_height, trees, width, height)
      score = 1

      # check north
      (tree_y-1).downto(0) do |y|
        if trees[y][tree_x] >= tree_height
          score = score * (tree_y - y)
          break
        elsif y == 0
          score = score * (tree_y - y)
        end
      end

      # south
      (tree_y+1).upto((height-1)) do |y|
        if trees[y][tree_x] >= tree_height
          score = score * (y-tree_y)
          break
        elsif y == (height-1)
          score = score * (y-tree_y)
        end
      end

      # west
      (tree_x-1).downto(0) do |x|
        if trees[tree_y][x] >= tree_height
          score = score * (tree_x-x)
          break
        elsif x == 0
          score = score * (tree_x-x)
        end
      end

      # east
      (tree_x+1).upto((width-1)) do |x|
        if trees[tree_y][x] >= tree_height
          score = score * (x-tree_x)
          break
        elsif x == (width-1)
          score = score * (x-tree_x)
        end
      end

      score
    end

    def has_view?(tree_x, tree_y, tree_height, trees, width, height)
      # north
      (tree_y-1).downto(0) do |y|
        if trees[y][tree_x] >= tree_height
          break
        elsif y == 0
          return true
        end
      end

      # south
      (tree_y+1).upto((height-1)) do |y|
        if trees[y][tree_x] >= tree_height
          break
        elsif y == (height-1)
          return true
        end
      end

      # west
      (tree_x-1).downto(0) do |x|
        if trees[tree_y][x] >= tree_height
          break
        elsif x == 0
          return true
        end
      end

      # east
      (tree_x+1).upto((width-1)) do |x|
        if trees[tree_y][x] >= tree_height
          break
        elsif x == (width-1)
          return true
        end
      end

      false
    end
  end
end
