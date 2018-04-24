require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    arr = Array.new(14) {Array.new([])}
    arr.each_with_index do |el, i|
      4.times {el << :stone} unless [6,13].include?(i)
    end
    arr
  end

  def valid_move?(start_pos)
    # p start_pos
    raise "Invalid starting cup" unless (1..14).include?(start_pos)
  end


  def make_move(start_pos, current_player_name)
    temparr = @cups[start_pos]
    @cups[start_pos] = []

    len = temparr.length
    i = 1
    count = 0
    while count < len
      case current_player_name
      when @player1
        k = start_pos + i
        k = k % 14
        if k == 13
          i += 1
        else
          @cups[k] << :stone
          i += 1
          count += 1
        end

      when @player2
        k = start_pos + i
        k = k % 14
        if k == 6
          i += 1
        else
          @cups[k] << :stone
          i += 1
          count += 1
        end
      end


    end
    render
    next_turn(current_player_name, k)
  end

  def next_turn(current_player, k)
    # helper method to determine what #make_move returns
    return :prompt if k == 6 && current_player == @player1
    return :prompt if k == 13 && current_player == @player2
    if @cups[k].length == 1
      return :switch
    else
      return k
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    arr1 = @cups[0..5]
    arr2 = @cups[7..12]
    return true if arr1.all? {|el| el.empty?} || arr2.all? {|el| el.empty?}
    return false
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 1 then return @player1
    when 0 then return :draw
    else
      return @player2
    end
  end
end
