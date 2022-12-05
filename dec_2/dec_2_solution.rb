# frozen_string_literal: true

strategy = File
           .read('strategy_input.txt')
           .split(/\n/)
           .map { |v| v.split(' ') }

item_points = {
  'X' => 1,
  'Y' => 2,
  'Z' => 3
}

outcome_points = {
  win: 6,
  draw: 3
}
winning_combos = {
  'A' => { win: 'Y', lose: 'Z', draw: 'X' },
  'B' => { win: 'Z', lose: 'X', draw: 'Y' },
  'C' => { win: 'X', lose: 'Y', draw: 'Z' }
}

item_map = {
  'X' => 'A',
  'Y' => 'B',
  'Z' => 'C'
}

win_map = {
  'X' => :lose,
  'Y' => :draw,
  'Z' => :win
}

point_total = 0
strategy.each do |play|
  point_total += item_points[play[1]]
  if play[0] == item_map[play[1]]
    point_total += outcome_points[:draw]
  elsif winning_combos[play[0]][:win] == play[1]
    point_total += outcome_points[:win]
  end
end

puts "Total Points: #{point_total}"

strategy = [
  %w[A Y],
  %w[B X],
  %w[C Z]
]

point_total = 0
strategy.each do |play|
  outcome = win_map[play[1]]
  item_played = winning_combos[play[0]][outcome]
  point_total += item_points[item_played]
  point_total += outcome_points[outcome] || 0
end
puts "With strategy: #{point_total}"
