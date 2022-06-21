class Grid
  attr_reader :grid_array

  def initialize
    reset
    show
  end

  def reset
    @grid_array = Array.new(3)
    @grid_array.map! { Array.new(3, ' . ') }
  end

  def check_for_win(player_instance)
    first_diagnonal = grid_array.collect.with_index { |_, i| grid_array[i][i] }
    second_diagonal = grid_array.reverse.collect.with_index { |_, i| grid_array.reverse[i][i] }

    grid_array.each_with_index do |row, j|
      if ( grid_array[0][j] == grid_array[1][j] && grid_array[1][j] == grid_array[2][j] && grid_array[0][j] != ' . ' ) || ( row.all?(' x ') || row.all?(' o ') ) || ( first_diagnonal.all?(' x ')  ||  first_diagnonal.all?(' o ') ) || ( second_diagonal.all?(' x ')  || second_diagonal.all?(' o ') ) 
        player_instance.won = true
        reset
      end
    end
  end

  def set_grid_array(row_index, column_index, choice)
    @grid_array[row_index][column_index] = " #{choice} "
  end

  def show
    @grid_array.each { |row| puts row.join }
    insert_line
  end

  def insert_line
    puts "\n-----------------------------\n\n"
  end
end