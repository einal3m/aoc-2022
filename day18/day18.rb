class Day18
  class << self
    X = 0
    Y = 1
    Z = 2

    def part1(input)
      cubes = Set.new(input.map{|line| line.split(",").map(&:to_i)})
      count_edges(cubes)
    end

    def part2(input)
      max_x = 0
      max_y = 0
      max_z = 0

      cubes = Set.new(input.map do |line| 
        coords = line.split(",").map(&:to_i)
        
        max_x = coords[X] if coords[X] > max_x
        max_y = coords[Y] if coords[Y] > max_y
        max_z = coords[Z] if coords[Z] > max_z

        coords
      end)

      max_x += 1
      max_y += 1
      max_z += 1

      # make a set of all the air in the area
      air = Set.new
      (0..max_z).to_a.each_with_index do |z|
        (0..max_y).to_a.each_with_index do |y|
          (0..max_x).to_a.each_with_index do |x|
            air.add([x,y,z]) if !cubes.include?([x,y,z])
          end
        end
      end

      # collect air that is connected to [0,0,0]
      connected_air = connect([0,0,0], air, Set.new([0,0,0]))
      trapped_air = air - connected_air

      count_edges(cubes) - count_edges(trapped_air)
    end

    private

    def count_edges(cubes)
      count = 0
      cubes.each do |cube|
        x = cube[0]
        y = cube[1]
        z = cube[2]

        if !cubes.include?([x+1, y, z])
          count += 1
        end
        if !cubes.include?([x-1, y, z])
          count += 1
        end
        if !cubes.include?([x, y+1, z])
          count += 1
        end
        if !cubes.include?([x, y-1, z])
          count += 1
        end
        if !cubes.include?([x, y, z+1])
          count += 1
        end
        if !cubes.include?([x, y, z-1])
          count += 1
        end
      end

      count
    end

    def connect(current_point, air, connected_air)
      x = current_point[X]
      y = current_point[Y]
      z = current_point[Z]

      # check in all directions, if it's air and not yet in connected air, then go down that path
      if air.include?([x+1, y, z]) && !connected_air.include?([x+1, y, z])
        connected_air.add([x+1, y, z])
        connected_air = connect([x+1, y, z], air, connected_air)
      end
      if air.include?([x-1, y, z]) && !connected_air.include?([x-1, y, z])
        connected_air.add([x-1, y, z])
        connected_air = connect([x-1, y, z], air, connected_air)
      end
      if air.include?([x, y+1, z]) && !connected_air.include?([x, y+1, z])
        connected_air.add([x, y+1, z])
        connected_air = connect([x, y+1, z], air, connected_air)
      end
      if air.include?([x, y-1, z]) && !connected_air.include?([x, y-1, z])
        connected_air.add([x, y-1, z])
        connected_air = connect([x, y-1, z], air, connected_air)
      end
      if air.include?([x, y, z+1]) && !connected_air.include?([x, y, z+1])
        connected_air.add([x, y, z+1])
        connected_air = connect([x, y, z+1], air, connected_air)
      end
      if air.include?([x, y, z-1]) && !connected_air.include?([x, y, z-1])
        connected_air.add([x, y, z-1])
        connected_air = connect([x, y, z-1], air, connected_air)
      end

      connected_air
    end
  end
end
