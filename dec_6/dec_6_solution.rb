# frozen_string_literal: true

stream = File.read('input.txt')

def find_marker(stream, beg_slice, end_slice, message_length)
  return 'Not Found' if end_slice > stream.length

  letters = stream[beg_slice..end_slice].split('')
  return "Found at character #{end_slice + 1}" if letters.uniq.count == message_length

  find_marker(stream, beg_slice + 1, end_slice + 1, message_length)
end

puts find_marker(stream, 0, 3, 4)

puts find_marker(stream, 0, 13, 14)
