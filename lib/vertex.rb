# frozen_string_literal: true

# Vertex Class
class Vertex
  attr_accessor :connections, :row, :column, :link, :parent

  def initialize
    @connections = LinkedList.new
    @row = nil
    @column = nil
    @parent = nil
  end
end
