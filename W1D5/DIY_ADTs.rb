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

class Queue
  attr_accessor :queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    print "Queue End "
    print @queue
    print "Queue Start"
  end
end

class Map
  attr_accessor :map
  def initialize
    @map = []
  end

  def assign(key, value)
    @map << [key, value] if @map.none? {|kv| kv.first == key}
  end

  def lookup(key)
    @map.select {|kv| kv.first == key}[0].last
  end

  def remove(key)
    @map.reject! {|kv| kv.first == key}
  end

  def show
    @map.each {|k| print "#{k.first} => #{k.last} \n"}
  end

end
