require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :row_number, :column_number, :turn_count

  def initialize(board = Board.new)
    @board = board
  end

  def ask_for_player1_name
    puts 'So, who goes first? Need to tag a name!'
    @player1_name = gets.chomp
  end

  def ask_to_choose_piece
    puts 'x or o?'
    @current_piece = gets.chomp
  end

  def verify_piece
    until @current_piece == 'x' || @current_piece == 'o'
      puts 'x or o?'
      @current_piece = gets.chomp
    end
  end

  def ask_for_player2_name
    puts "And what's your other name? ;)"
    @player2_name = gets.chomp
  end

  def announces_player1
    puts "#{@current_piece} it is, #{@player1_name}!"
  end

  def announces_player2
    puts "#{@player2.piece} for #{@player2.name}"
    puts "#{@player2_name}... The challenger!"
    puts '----------------------------------'
  end

  def assigns_player2_piece
    if    @current_piece == 'o' then @current_piece = 'x' 
    elsif @current_piece == 'x' then @current_piece = 'o'
    end
  end

  def initialize_turn_count
    @turn_count = 1
  end

  def player1_phase
    ask_for_player1_name
    ask_to_choose_piece
    verify_piece
    @player1 = Player.new(@player1_name, @current_piece)
    announces_player1
  end

  def player2_phase
    ask_for_player2_name
    assigns_player2_piece
    @player2 = Player.new(@player2_name, @current_piece)
    announces_player2
  end

  def start_game
    board.put_board_with_header

    player1_phase
    player2_phase

    initialize_turn_count
    loop_until_win(board)
  end

  def either_player_has_won?
    @player1.won? || @player2.won?
  end

  def announce_draw
    puts 'Draw!'
  end

  def turn_message
    if turn_count.odd?
      puts "Your turn, #{@player1.name}"
    elsif turn_count.even?
      puts "Your turn, #{@player2.name}"
    end
  end

  def choose_player_to_choose
    if turn_count.odd?
      @player1.choose(row_number, column_number, board)
    elsif turn_count.even?
      @player2.choose(row_number, column_number, board)
    end
  end

  def loop_until_win(board)
    until either_player_has_won?
      if board.no_empty_slots?
        announce_draw
        break
      end

      turn_message
      ask_for_coordinates
      board.save_coordinates(row_number, column_number)
      choose_player_to_choose

      @turn_count += 1
    end
  end

  def ask_for_coordinates
    print 'Input row index: '
    @row_number = gets.chomp.to_i

    print 'Input column index: '
    @column_number = gets.chomp.to_i
  end
end
