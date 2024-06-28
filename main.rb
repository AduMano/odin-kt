# frozen_string_literal: true

require_relative('lib/board')

# Init Board
$chess = Board.new

# Function Move_Knight
def move_knight(from, to)
  location = $chess.board[from[0]][from[1]]

  puts location.to_s
  puts location.row
  puts location.column

  puts location.connections
end

move_knight([0, 0], [1, 2])
