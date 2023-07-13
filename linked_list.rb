class LinkedList
  attr_reader :root, :size

  def initialize
    @root = Node.new(nil)
    @size = 0
  end

  def to_s
    read_node = @root.pointer
    while (read_node.pointer != nil)
      print "( #{read_node.value} ) -> "
      read_node = read_node.pointer
    end
    print "( #{read_node.value} ) -> "
    p nil
  end

  def append (value)
    read_node = @root
    while (read_node.pointer != nil)
      read_node = read_node.pointer
    end
    read_node.pointer = Node.new(value)
    @size += 1
  end

  def prepend (value)
    read_node = @root
    pointer = read_node.pointer
    read_node.pointer = Node.new(value, pointer)
    @size += 1
  end

  def head
    @root.pointer.value
  end

  def tail
    read_node = @root
    while (read_node.pointer != nil)
      read_node = read_node.pointer
    end
    read_node.value 
  end

  def at (index)
    read_node = @root
    for i in 0..(index)
      read_node = read_node.pointer
    end
    read_node.value
  end

  def pop
    read_node = @root
    x = 0
    while (read_node.pointer != nil)
      x += 1
      read_node = read_node.pointer
    end
    read_node = @root
    for i in 0..x-2 do
      read_node = read_node.pointer
    end
    read_node.pointer = nil
    @size -= 1
  end

  def contains? (value)
    read_node = @root
    while (read_node.value != value && read_node.pointer != nil)
      read_node = read_node.pointer
    end
    if (read_node.value == value)
      true
    else
      false
    end
  end

  def find (value)
    read_node = @root
    i = 0
    while (read_node.value != value && read_node.pointer != nil)
      read_node = read_node.pointer
      i += 1
    end
    if (read_node.value == value)
      i-1
    else
      nil
    end
  end

  def insert_at (value, index)
    read_node = @root
    for i in 0..index-1
      read_node = read_node.pointer
    end
    pointer = read_node.pointer
    read_node.pointer = Node.new(value, pointer)
  end

  def remove_at (index)
    read_node = @root
    for i in 0..index+1
      read_node = read_node.pointer
    end
    pointer = read_node
    read_node = @root
    for i in 0..index-1
      read_node = read_node.pointer
    end
    read_node.pointer = pointer
  end
end

class Node
  attr_accessor :value, :pointer

  def initialize (value, pointer=nil)
    @value = value
    @pointer = pointer
  end
end