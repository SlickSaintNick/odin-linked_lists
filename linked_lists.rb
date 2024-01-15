# frozen_string_literal: true

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  # prepend(value) adds a new node containing value to the start of the list
  def prepend(value)
    @head = Node.new(value, @head)
    value
  end

  # append(value) adds a new node containing value to the end of the list
  def append(value)
    if @head.nil?
      prepend(value)
    else
      tail.next_node = Node.new(value, nil)
    end
    value
  end

  # size returns the total number of nodes in the list
  def size
    size = 0
    cursor = Node.new(nil, @head)

    until cursor.next_node.nil?
      cursor = cursor.next_node
      size += 1
    end
    size
  end

  # tail returns the last node in the list
  def tail
    cursor = Node.new(nil, @head)
    cursor = cursor.next_node until cursor.next_node.nil?
    cursor
  end

  # at(index) returns the node at the given index
  def at(index)
    counter = -1
    cursor = Node.new(nil, @head)

    until counter == index || cursor.next_node.nil?
      counter += 1
      cursor = cursor.next_node
    end

    counter == index ? cursor : nil
  end

  # pop removes the last element from the list, and returns its value
  def pop
    temp = at(size - 1)
    at(size - 2).next_node = nil
    temp.value
  end

  # contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    cursor = Node.new(nil, @head)
    cursor = cursor.next_node until cursor.value == value || cursor.next_node.nil?
    cursor.value == value
  end

  # find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
    counter = -1
    cursor = Node.new(nil, @head)

    until cursor.value == value || cursor.next_node.nil?
      cursor = cursor.next_node
      counter += 1
    end

    cursor.value == value ? counter : nil
  end

  # to_s represent your LinkedList objects as strings, so you can print them out and preview them
  # in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    string = ''
    cursor = Node.new(nil, @head)

    until cursor.next_node.nil?
      cursor = cursor.next_node
      string += "( #{cursor.value} ) -> "
    end

    "#{string}nil"
  end

  # insert_at(value, index) that inserts a new node with the provided value at the given index.
  def insert_at(value, index)
    return nil if at(index - 1).nil?

    temp = at(index - 1)
    at(index - 1).next_node = Node.new(value, temp.next_node)
    value
  end

  # remove_at(index) that removes the node at the given index.
  def remove_at(index)
    return nil if at(index).nil?

    temp = at(index)
    at(index - 1).next_node = at(index).next_node
    temp.value
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

def puts_line
  puts '-------------------'
end

Colors = LinkedList.new
puts "Colors: #{Colors}"
puts "Prepend #{Colors.prepend('Green')}"
puts "Prepend #{Colors.prepend('Red')}"
puts "Append #{Colors.append('Blue')}"
puts "Colors: #{Colors}"
puts_line

puts "Colors list size = #{Colors.size}"
puts 'Colors list head = '
puts Colors.head.value
puts 'Colors list tail = '
puts Colors.tail.value
puts 'Color at index 2 = '
puts Colors.at(2).nil? ? 'nil' : Colors.at(2).value
puts 'Colors at index 10 = '
puts Colors.at(10).nil? ? 'nil' : Colors.at(10).value
puts "Pop the last color... #{Colors.pop}"
puts Colors
puts_line

puts "Insert #{Colors.insert_at('Blue', 2)} at index 2..."
puts "Insert #{Colors.insert_at('Orange', Colors.find('Red') + 1)} after Red..."
puts "Insert #{Colors.insert_at('Yellow', Colors.find('Green'))} before Green..."
puts "Append #{Colors.append('Indigo')}..."
puts "Append #{Colors.append('Violet')}..."
puts Colors
puts_line

puts "Remove #{Colors.remove_at(Colors.find('Indigo'))}..."
puts Colors
puts Colors.contains?('Indigo') ? 'Indigo is still here.' : 'Indigo is gone now.'
puts Colors.contains?('Violet') ? 'Violet is still here.' : 'Violet is gone now.'
puts_line
