class Stack
  attr_accessor :stack

  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    puts @stack.reverse
    puts "BOTTOM"
  end

end
