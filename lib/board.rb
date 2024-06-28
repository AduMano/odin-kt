# frozen_string_literal: true

require_relative('list/linked_list')
require_relative('vertex')

# Class Board
class Board
  attr_accessor :board

  def initialize()
    @board = Array.new(8) { Array.new(8) { Vertex.new } }
    build_board
  end

  private

  def build_board
    # Do a breadth-first Algorithm to fill up the vertices
    # Start at Node [0][0]
    @board.each_with_index do |row, y| # Row
      row.each_with_index do |vertex, x| # Column
        # Set current vertex properties
        vertex.row = y
        vertex.column = x
        # Get Possible Destinations by moving total of 4 blocks forming an L shape
        get_possible_destinations(x, y).each { |node| vertex.connections.append(node) }
      end
    end
  end

  def get_possible_destinations(x, y) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity,Naming/MethodParameterName
    destinations = []
    # Check Top Left (2 Outcomes)
    destinations.push(@board[y - 1][x - 2]) if (y - 1) >= 0 && (x - 2) >= 0
    destinations.push(@board[y - 2][x - 1]) if (y - 2) >= 0 && (x - 1) >= 0

    # Check Top Right (2 Outcomes)
    destinations.push(@board[y - 1][x + 2]) if (y - 1) >= 0 && (x + 2) <= 7
    destinations.push(@board[y - 2][x + 1]) if (y - 2) >= 0 && (x + 1) <= 7

    # Check Bottom Left (2 Outcomes)
    destinations.push(@board[y + 1][x - 2]) if (y + 1) <= 7 && (x - 2) >= 0
    destinations.push(@board[y + 2][x - 1]) if (y + 2) <= 7 && (x - 1) >= 0

    # Check Bottom Right (2 Outcomes)
    destinations.push(@board[y - 1][x + 2]) if (y - 1) <= 7 && (x + 2) <= 7
    destinations.push(@board[y - 2][x + 1]) if (y - 2) <= 7 && (x + 1) <= 7

    destinations
  end
end
