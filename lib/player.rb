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