FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
TILES = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
class Array
  def mergesort
    return self if self.length <= 1

    mid = self.length / 2
    leftsorted = self.take(mid).mergesort
    rightsorted = self.drop(mid).mergesort
    merge(leftsorted, rightsorted)
  end

  def merge(left, right)
    result = []
    until left.empty? || right.empty?
      case left[0].length <=> right[0].length
      when -1
        result << left.shift
      when 0
        result << left.shift
      else
        result << right.shift
      end
    end
    result + left + right
  end
end

class Octopus
  def sluggish
    i = 0
    while i < FISHES.length
      return FISHES[i] if FISHES.all? {|fish| fish.length <= FISHES[i].length}
      i+=1
    end
  end

  def dominant
    p FISHES.mergesort[-1]
  end



  def clever
    i = 0
    longest_fish = FISHES[0]
    while i < FISHES.length
      longest_fish = FISHES[i] if FISHES[i].length >= longest_fish.length
      i+=1
    end
    p longest_fish
  end

  def slow_dance(str,arr)
    (0...arr.length).each do |dir_idx|
      return dir_idx if arr[dir_idx] == str
    end
  end

  def constant_dance(str, arr)
    hsh = Hash.new
    arr.each_with_index {|el,i| hsh[el] = i}
    hsh[str]
  end
end

octp = Octopus.new

p octp.sluggish
p octp.dominant
p octp.clever
p octp.slow_dance("up", TILES)
p octp.constant_dance("right-down", TILES)
