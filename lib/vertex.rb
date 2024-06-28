# frozen_string_literal: true

# Vertex Class
class Vertex
  attr_accessor :connections, :row, :column, :link

  def initialize
    @connections = LinkedList.new
    @row = nil
    @column = nil
    @link = nil
  end
end
