class Day07
  class << self
    def part1(input)
      directory = process_directories(input)
      directory.map do |dir, count|
        total_dir_count = directory.filter{|sub_dir, _| sub_dir.include?(dir)}.map{|_, count| count}.sum
        total_dir_count > 100000 ? 0 : total_dir_count
      end.sum
    end

    def part2(input)
      directory = process_directories(input)

      total_dir_counts = {}
      directory.each do |dir, count|
        total_dir_counts[dir] = directory.filter{|sub_dir, _| sub_dir.include?(dir)}.map{|_, count| count}.sum
      end

      unused_space = 70000000 - total_dir_counts["/"]
      required_saving = 30000000 - unused_space

      total_dir_counts.values.filter{|val| val > required_saving}.min
    end

    private

    def process_directories(input)
      directory = {}
      pwd = []
      input.each do |line|
        if /^\$ cd \.\.$/ =~ line
          pwd.pop
        elsif /^\$ cd (.+)$/ =~ line
          pwd.push($1)
          directory[pwd.join("/")] ||= 0
        elsif /^(\d+) (.+)$/ =~ line
          directory[pwd.join("/")] += $1.to_i
        end
      end
      directory
    end
  end
end




