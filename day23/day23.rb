class Day23
  class << self
    N = [0, -1]
    NE = [1, -1]
    E = [1, 0]
    SE = [1, 1]
    S = [0, 1]
    SW = [-1, 1]
    W = [-1, 0]
    NW = [-1, -1]

    ALL_DIRS = [N, NE, E, SE, S, SW, W, NW]

    def part1(input)
      elves = parse(input)
      looking_dirs = [[N, NE, NW], [S, SE, SW], [W, NW, SW], [E, NE, SE]]

      10.times do
        # check whether elves can/want to move:
        elves.each do |coords, elf|

          stay = ALL_DIRS.all? do |dir|
            elves[[coords[0]+dir[0], coords[1]+dir[1]]].nil?
          end

          if stay
            elves[coords] = {action: :stay}
            next
          else
            move_direction = ponder_move(elves, coords, looking_dirs)
            if move_direction.nil?
              elves[coords] = {action: :stay}
            else
              elves[coords] = {action: :move, location: [coords[0]+move_direction[0], coords[1]+move_direction[1]]}
            end
          end
        end

        # move the elves if they want and can
        new_elves = {}
        elves.each do |coords, action|
          if action[:action] == :stay
            new_elves[coords] = true
          elsif elves.filter{|c,a| a[:location] == action[:location]}.count > 1
            new_elves[coords] = true
          else
            new_elves[action[:location]] = true
          end
        end
        
        elves = new_elves
        looking_dirs = looking_dirs.rotate(1)
      end

      count_empty(elves)
    end

    def part2(input)
      elves = parse(input)
      total_elves = elves.count
      looking_dirs = [[N, NE, NW], [S, SE, SW], [W, NW, SW], [E, NE, SE]]
      rounds = 1

      loop do
        no_staying = 0
        no_cant_move = 0
        no_try_to_move = 0

        # check whether elves can/want to move:
        elves.each do |coords, elf|
          stay = ALL_DIRS.all? do |dir|
            elves[[coords[0]+dir[0], coords[1]+dir[1]]].nil?
          end

          if stay
            elves[coords] = {action: :stay}
            no_staying += 1
            next
          else
            move_direction = ponder_move(elves, coords, looking_dirs)
            if move_direction.nil?
              elves[coords] = {action: :stay}
              no_cant_move += 1
            else
              elves[coords] = {action: :move, location: [coords[0]+move_direction[0], coords[1]+move_direction[1]]}
              no_try_to_move += 1
            end
          end
        end

        # move the elves if they want and can
        no_of_elves_moved = 0
        any_moves = false
        new_elves = {}
        elves.each do |coords, action|
          if action[:action] == :stay
            new_elves[coords] = true
          elsif elves.filter{|c,a| a[:location] == action[:location]}.count > 1
            new_elves[coords] = true
          else
            new_elves[action[:location]] = true
            no_of_elves_moved += 1
            any_moves = true
          end
        end          

        # print something as this code is slow and want to see progress!
        puts "round #{rounds}, #{no_of_elves_moved}/#{total_elves} elves moved, #{no_staying} staying, #{no_cant_move} cant move, #{no_try_to_move} want to move"
        
        if !any_moves
          return rounds
        end

        elves = new_elves
        looking_dirs = looking_dirs.rotate(1)
        rounds += 1
      end

      0 # shouldn't get here
    end

    private 

    def ponder_move(elves, coords, looking_dirs)
      looking_dirs.each do |dir_group|
        move = dir_group.all? do |dir|
          elves[[coords[0]+dir[0], coords[1]+dir[1]]].nil?
        end

        if move
          return dir_group[0]
        end
      end

      return nil
    end

    def parse(input)
      elves = {}
      input.each_with_index do |line, y|
        line.chars.each_with_index do |char, x|
          if char == "#"
            elves[[x,y]] = true
          end
        end
      end
      elves
    end

    def count_empty(elves)
      min_x = elves.keys.min{|a, b| a[0] <=> b[0]}[0]
      max_x = elves.keys.max{|a, b| a[0] <=> b[0]}[0]
      min_y = elves.keys.min{|a, b| a[1] <=> b[1]}[1]
      max_y = elves.keys.max{|a, b| a[1] <=> b[1]}[1]

      count = 0
      (min_y..max_y).each_with_index do |y|
        (min_x..max_x).each_with_index do |x|
          count += 1 if elves[[x,y]].nil?
        end
      end

      count
    end
    
    def print(elves)
      p ""
      min_x = elves.keys.min{|a, b| a[0] <=> b[0]}[0]
      max_x = elves.keys.max{|a, b| a[0] <=> b[0]}[0]
      min_y = elves.keys.min{|a, b| a[1] <=> b[1]}[1]
      max_y = elves.keys.max{|a, b| a[1] <=> b[1]}[1]

      (min_y..max_y).each_with_index do |y|
        line = ""
        (min_x..max_x).each_with_index do |x|
          line += elves[[x,y]].nil? ? "." : "#"
        end
        puts line
      end

      p ""
    end
  end
end
