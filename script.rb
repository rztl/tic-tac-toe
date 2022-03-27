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
    @grid_array.each { |row| p row.join }
    insert_line
  end

  def insert_line
    puts "\n-----------------------------\n\n"
  end
end

class Player
  attr_accessor :won
  attr_reader :marker, :name

  def initialize(name, marker, won = false)
    @name = name
    @marker = marker
    @won = won
  end

  def choose(row_index, column_index, grid_instance)
    grid_instance.set_grid_array(row_index, column_index, @marker)
    grid_instance.show
    grid_instance.check_for_win(self)

    if @won
      puts "#{@name} won!" 
    end
  end
end
#--------------------------------------------------------------------
puts 'So, who goes first? Need to tag a name!'
first_player_name = gets.chomp

puts 'x or o?'
x_or_o = gets.chomp 

until x_or_o == 'x' || x_or_o == 'o'
  puts "I respect that you think 'x'es and 'o's are boring, but my code only takes either of those unfortunately..."
  x_or_o = gets.chomp
end

player_1 = Player.new(first_player_name, x_or_o)
puts "#{x_or_o} it is, #{first_player_name}!"

puts "And what's your other name? ;)"
second_player_name = gets.chomp


if    x_or_o == 'o' then x_or_o = 'x' 
elsif x_or_o == 'x' then x_or_o = 'o'
end

player_2 = Player.new(second_player_name, x_or_o)

puts "#{player_2.marker} for #{player_2.name}"

puts "#{second_player_name}... The challenger!"

puts 'Creating grid...'

puts '---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ---- ----'

grid = Grid.new


turn = 1

until player_1.won || player_2.won
  
  none_boolean_array = grid.grid_array.collect{ |row| row.none?(' . ') }

  if none_boolean_array.all?(true)
    puts "Draw!"
    break
  end

  if turn.odd?
    puts "Your turn, #{player_1.name}"
  elsif turn.even?
    puts "Your turn, #{player_2.name}"
  end

  print 'Input row index: '
  i = gets.chomp.to_i

  print 'Input column index: '
  j = gets.chomp.to_i

  unless grid.grid_array[i][j] == ' . '
    puts "That one is already marked..."
    next
  end

  if turn.odd?
    player_1.choose(i, j, grid)
  elsif turn.even?
    player_2.choose(i, j, grid)
  end

  turn += 1
end
