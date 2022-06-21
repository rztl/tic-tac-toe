require './lib/grid'
require './lib/player'

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
