# frozen_string_literal: true

# read in file cole golf :|
require 'benchmark'

Benchmark.bm do |x|
  x.report do
    cal_counts = File
                 .read('calorie_input.txt')
                 .gsub(/\n{1}/, ',').split(',,')
                 .map { |group| group.split(',').map(&:to_i).sum }

    puts "Single Elf max: #{cal_counts.max}"

    # three elfs worth

    puts "Three elf max: #{cal_counts.max(3).sum}"
  end
end
