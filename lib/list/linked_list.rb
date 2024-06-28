# frozen_string_literal: true

require_relative('node')

# LinekdList Class
class LinkedList
  attr_accessor :head
  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  # Recursive Approach
  def append(data, new_node = Node.new(data), current = @head)
    current.nil? ? @head = new_node : tail.link = new_node

    @size += 1
    true
  end

  def prepend(data)
    @head = Node.new(data, @head)
    @size += 1
    true
  end

  # Recursive Approach
  def tail(current = @head)
    return tail(current.link) unless current.link.nil?

    current
  end

  # Recursive Approach
  def at(index, current = @head, accumulator = 0)
    return current if index == accumulator
    return tail if (index + 1) == @size
    return nil if (index + 1) > @size

    at(index, current.link, accumulator + 1)
  end

  # Recursive Approach
  def pop(last_node = tail, current = @head)
    if current.link.eql?(last_node)
      disposed_node = current.link
      current.link = nil
      @size -= 1
      disposed_node
    else
      pop(last_node, current.link)
    end
  end

  # Recursive Approach
  def contains?(data)
    find(data) ? true : false
  end

  # Recursive Approach
  def find(data, index = 0, current = @head)
    return index if current.data.eql?(data)
    return nil if current.link.nil?

    find(data, index + 1, current.link)
  end

  # Recursion Approach
  def to_s(current = @head, output = '')
    return output << 'nil' if current.nil?

    output += "(#{current.data.row}, #{current.data.column}) -> "
    to_s(current.link, output)
  end

  # Recursive Approach
  def insert_at(value, index, accumulator = 0, current = @head)
    return prepend(value) if index.zero?
    return false if (index + 1) > @size

    if index.eql?(accumulator + 1)
      current.link = Node.new(value, current.link)
      @size += 1
      true
    else
      insert_at(value, index, accumulator + 1, current.link)
    end
  end

  # Recursive Approach
  def remove_at(index, accumulator = 0, current = @head) # rubocop:disable Metrics/MethodLength
    return false if (index + 1) > @size

    if index.eql?(0)
      @head = current.link
      @size -= 1
      return true
    elsif index.eql?(accumulator + 1)
      current.link = current.link.link
      @size -= 1
      return true
    end

    remove_at(index, accumulator + 1, current.link)
  end
end
