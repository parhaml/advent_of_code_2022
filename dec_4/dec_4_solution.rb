# frozen_string_literal: true

assignments = File
              .read('assignments.txt')
              .split(/\n/)
              .map do |row|
                row.split(',')
              end.map do |row|
                row.map { |v| v.split('-').map(&:to_i) }
              end

def contained(a, b)
  a.first >= b.first && a.last <= b.last
end

c = assignments.count do |elf1, elf2|
  contained(elf1, elf2) || contained(elf2, elf1)
end

puts "Contained total: #{c}"
def overlap(a, b)
  a.first.between?(*b) || a.last.between?(*b)
end

d = assignments.count do |elf1, elf2|
  overlap(elf1, elf2) || overlap(elf2, elf1)
end
puts "Overlap total: #{d}"

