class Player
  attr_reader :piece, :name, :won

  def initialize(name = nil, piece = nil)
    @name = name
    @piece = piece
    @won = false
  end

  def choose(row_index, column_index, board_instance)
    board_instance.set_board_array(row_index, column_index, @piece)
    board_instance.put_board
    board_instance.check_for_win(self)

    put_win_message if won?
  end

  def put_win_message
    puts "#{@name} won!" 
  end

  def mark_as_won
    @won = true
  end

  def won?
    @won
  end
end
