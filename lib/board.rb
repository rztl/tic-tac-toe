class Board
  attr_reader :board_array,
              :row, :column, :left_diagonal, :right_diagonal,
              :latest_placement_coordinates

  def initialize
    @board_array = Array.new(3) { Array.new(3, ' . ') }
  end

  def check_for_win(player_instance)
    collect_row_column_and_diagonals

    player_instance.mark_as_won if any_succession?
  end

  def collect_row_column_and_diagonals
    collect_row
    collect_column
    collect_left_diagonal
    collect_right_diagonal
  end

  def any_succession?
    row_succession? || column_succession? || diagonal_succession?
  end

  def row_succession?
    row.all?(' x ') || row.all?(' o ')
  end

  def column_succession?
    column.all?(' x ') || column.all?(' o ')
  end

  def diagonal_succession?
    left_diagonal_succession? || right_diagonal_succession?
  end

  def left_diagonal_succession?
    left_diagonal.all?(' x ')  || left_diagonal.all?(' o ')
  end

  def right_diagonal_succession?
    right_diagonal.all?(' x ') || right_diagonal.all?(' o ')
  end

  def collect_row
    @row = board_array[row_number]
  end

  def row_number
    latest_placement_coordinates[:row_number]
  end

  def collect_column
    @column = board_array.collect { |row| row[column_number] }
  end
  
  def column_number
    latest_placement_coordinates[:column_number]
  end

  def collect_left_diagonal
    @left_diagonal = board_array.collect.with_index { |_, index| board_array[index][index] }
  end

  def collect_right_diagonal
    reversed_board_array = board_array.reverse
    @right_diagonal = reversed_board_array.collect.with_index { |_, index| reversed_board_array[index][index] }
  end

  def set_board_array(row_index, column_index, choice)
    @board_array[row_index][column_index] = " #{choice} "
  end

  def put_board_with_header
    put_board_creation_header
    put_board_rows
    put_ending_cap_and_empty_lines
  end

  def put_board_creation_header
    puts "\n"
    puts '------------------------------------------------'
    puts 'Creating board...'
    puts '--------------------------------------------'
    puts "\n"
  end

  def put_board
    put_board_rows
  end

  def put_board_rows
    board_array.each { |row| puts row.join }
  end

  def put_ending_cap_and_empty_lines
    puts "\n"
    puts '---------------'
    puts "\n\n"
  end

  def save_coordinates(row_number, column_number)
    @latest_placement_coordinates = { row_number:, column_number: }
  end

  def no_empty_slots?
    board_array.all? { |row| row.none?(' . ') }
  end
end
