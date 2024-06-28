# frozen_string_literal: true

require_relative('lib/board')

# Function Move_Knight
def move_knight(from, to)
  if from.eql?(to)
    puts 'Didn\'t move at all'
    puts "[#{from[0]}, #{from[1]}]"
    return
  end
  
  # Init Board
  board = Board.new
  shortest_path = board.find_path(from, to)

  puts "You made it in #{shortest_path.length - 1} move/s! Here's your path:"
  shortest_path.each { |path| puts path.to_s }
end

move_knight([3, 3], [4, 3])
