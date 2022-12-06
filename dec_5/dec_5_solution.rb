# frozen_string_literal: true

moves = File
        .read('crates.txt')
        .split(/\n/)
        .map do |row|
  row.scan(/\d+/).map(&:to_i)
end

layout = {
  1 => %w[N S D C V Q T],
  2 => %w[M F V],
  3 => %w[F Q W D P N H M],
  4 => %w[D Q R T F],
  5 => %w[R F M N Q H V B],
  6 => %w[C F G N P W Q],
  7 => %w[W F R L C T],
  8 => %w[T Z N S],
  9 => %w[M S D J R Q H N]
}

moves.each do |num_moves, from, to|
  num_moves.times do
    crate = layout[from].pop
    layout[to] << crate
  end
end

message = layout.map do |_, v|
  v.last
end.join('')

puts "Message: #{message}"

layout = {
  1 => %w[N S D C V Q T],
  2 => %w[M F V],
  3 => %w[F Q W D P N H M],
  4 => %w[D Q R T F],
  5 => %w[R F M N Q H V B],
  6 => %w[C F G N P W Q],
  7 => %w[W F R L C T],
  8 => %w[T Z N S],
  9 => %w[M S D J R Q H N]
}
moves.each do |num_crates, from, to|
  tmp = layout[to]
  moving = layout[from].pop(num_crates)
  tmp << moving
  layout[to] = tmp.flatten!
end

message = layout.map do |_, v|
  v.last
end.join('')


puts "Batch: #{message}"
