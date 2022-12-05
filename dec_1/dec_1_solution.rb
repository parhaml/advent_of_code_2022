# frozen_string_literal: true

cal_counts = File
             .read('calorie_input.txt')
             .gsub(/\n{1}/, ',').split(',,')
             .map { |group| group.split(',').map(&:to_i).sum }

puts "Single Elf max: #{cal_counts.max}"

puts "Three elf max: #{cal_counts.max(3).sum}"
