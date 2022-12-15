class Day15
  class << self
    def part1(input, target_y)
      sensors, beacons, dims = parse(input)

      count = 0
      (dims[:min_x]..dims[:max_x]).to_a.each do |x|
        can_see = sensors.any? do |sensor|
          ((sensor[:x] - x).abs + (sensor[:y] - target_y).abs) <= sensor[:distance]
        end

        if can_see
          if beacons[position(x, target_y)].nil?
            count += 1
          end
        end
      end

      count
    end

    def part2(input, max)
      sensors = parse_sensors(input)
      borders = find_borders(sensors)

      # find the point on the borders where 4 different edges meet
      point = borders.filter{|point, val| val.uniq.sum == 15 && point[0] >= 0 && point[0] <= max && point[1] >= 0 && point[1] <= max}.keys.first
      point[0] * 4000000 + point[1]
    end

    private

    def parse(input)
      max_x = 0
      max_y = 0
      min_x = 0
      min_y = 0

      beacons = {}

      sensors = input.map do |line|
        if /^Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)$/ =~ line
          sensor_x = $1.to_i
          sensor_y = $2.to_i
          beacon_x = $3.to_i
          beacon_y = $4.to_i
          distance = (sensor_x - beacon_x).abs + (sensor_y - beacon_y).abs
          beacons[position(beacon_x, beacon_y)] = true

          if min_x > sensor_x - distance
            min_x = sensor_x - distance
          end
          if max_x < sensor_x + distance
            max_x = sensor_x + distance
          end

          if min_y > sensor_y - distance
            min_y = sensor_y - distance
          end
          if max_y < sensor_y + distance
            max_y = sensor_y + distance
          end

          {
            x: sensor_x,
            y: sensor_y,
            distance: distance
          }
        end
      end

      [sensors, beacons, {min_x: min_x, min_y: min_y, max_x: max_x, max_y: max_y}]
    end

    def parse_sensors(input)
      sensors = input.map do |line|
        if /^Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)$/ =~ line
          sensor_x = $1.to_i
          sensor_y = $2.to_i
          beacon_x = $3.to_i
          beacon_y = $4.to_i
          distance = (sensor_x - beacon_x).abs + (sensor_y - beacon_y).abs

          {
            x: sensor_x,
            y: sensor_y,
            distance: distance
          }
        end
      end

      sensors
    end

    def find_borders(sensors)
      grid = {}

      # mark the border of each sensor with a different number
      sensors.each do |sensor|
        distance = sensor[:distance]
        x = sensor[:x]
        y = sensor[:y]
        (distance+1).times.each_with_index do |i|
          grid[[x+i,y+distance+1-i]] = (grid[[x+i,y+distance+1-i]] || []) << 1
          grid[[x+distance+1-i, y-i]] = (grid[[x+distance+1-i, y-i]] || []) << 2
          grid[[x-i, y-distance-1+i]] = (grid[[x-i, y-distance-1+i]] || []) << 4
          grid[[x-distance-1+i, y+i]] = (grid[[x-distance-1+i, y+i]] || []) << 8
        end
      end

      grid
    end

    def position(x, y)
      "(#{x}, #{y})"
    end
  end
end
