lines = File
        .read('packing_input.txt')
        .split(/\n/)

packs = lines.flat_map do |str|
  str[0, str.size / 2].split('') & str[str.size / 2..-1].split('')
end


def priority_for_letter(letter)
  if /[[:lower:]]/.match(letter)
    letter.ord - 96
  else
    letter.ord - 38
  end
end

total_priority = 0
packs.each do |pack|
  total_priority += priority_for_letter(pack)
end

puts "Prioity One: #{total_priority}"

group_total = 0
lines.each_slice(3) do |group|
  letter = group[0].split('') & group[1].split('') & group[2].split('')
  group_total += priority_for_letter(letter.first)
end

puts "Priority Two: #{group_total}"

