class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over == true
      take_turn
      system("clear")
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    userseq = require_sequence
     if game_over == false
       round_success_message
       @sequence_length += 1
     end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.25
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Enter sequence:"

    @seq.each do |color|
      userseq = gets.chomp
      if color != userseq
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "round success"
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
