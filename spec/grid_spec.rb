require './lib/grid'
require './lib/player'
require './lib/query'

describe Grid do
  
  describe '#check_for_win' do
    let(:player) { Player.new }

    context 'when xxx on first row' do
      let(:grid_array) do 
        [ 
          [' x ', ' x ', ' x '],
          [' . ', ' . ', ' . '],
          [' . ', ' . ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when xxx on second row' do
      let(:grid_array) do 
        [ 
          [' . ', ' . ', ' . '],
          [' x ', ' x ', ' x '],
          [' . ', ' . ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when xxx on third row' do
      let(:grid_array) do 
        [ 
          [' . ', ' . ', ' . '],
          [' . ', ' . ', ' . '], 
          [' x ', ' x ', ' x ']
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when ooo on first row' do
      let(:grid_array) do 
        [ 
          [' o ', ' o ', ' o '],
          [' . ', ' . ', ' . '],
          [' . ', ' . ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when ooo on second row' do
      let(:grid_array) do 
        [ 
          [' . ', ' . ', ' . '],
          [' o ', ' o ', ' o '],
          [' . ', ' . ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when ooo on third row' do
      let(:grid_array) do 
        [ 
          [' . ', ' . ', ' . '],
          [' . ', ' . ', ' . '], 
          [' o ', ' o ', ' o ']
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when xxx on first column' do
      let(:grid_array) do 
        [ 
          [' x ', ' . ', ' . '],
          [' x ', ' . ', ' . '],
          [' x ', ' . ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when xxx on second column' do
      let(:grid_array) do 
        [ 
          [' . ', ' x ', ' . '],
          [' . ', ' x ', ' . '],
          [' . ', ' x ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when xxx on third column' do
      let(:grid_array) do 
        [ 
          [' . ', ' . ', ' x '],
          [' . ', ' . ', ' x '],
          [' . ', ' . ', ' x '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when ooo on first column' do
      let(:grid_array) do 
        [ 
          [' o ', ' . ', ' . '],
          [' o ', ' . ', ' . '],
          [' o ', ' . ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when ooo on second column' do
      let(:grid_array) do 
        [ 
          [' . ', ' o ', ' . '],
          [' . ', ' o ', ' . '],
          [' . ', ' o ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when ooo on third column' do
      let(:grid_array) do 
        [ 
          [' . ', ' . ', ' o '],
          [' . ', ' . ', ' o '],
          [' . ', ' . ', ' o '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when xxx on left diagnonal' do
      let(:grid_array) do 
        [ 
          [' x ', ' . ', ' . '],
          [' . ', ' x ', ' . '],
          [' . ', ' . ', ' x '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when xxx on right diagnonal' do
      let(:grid_array) do 
        [ 
          [' . ', ' . ', ' x '],
          [' . ', ' x ', ' . '],
          [' x ', ' . ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when ooo on left diagnonal' do
      let(:grid_array) do 
        [ 
          [' o ', ' . ', ' . '],
          [' . ', ' o ', ' . '],
          [' . ', ' . ', ' o '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end

    context 'when ooo on right diagnonal' do
      let(:grid_array) do 
        [ 
          [' . ', ' . ', ' o '],
          [' . ', ' o ', ' . '],
          [' o ', ' . ', ' . '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }

      it 'returns a @won of true' do
        grid.check_for_win(player)
        expect(player.won).to eq(true)
      end
    end
  end

  describe '#loop_until_win' do
    context 'when draw and Player One has x and the last turn' do
      let(:player_one) { Player.new('Player One', 'x', false) } 
      let(:player_two) { Player.new('Player Two', 'o', false) } 

      let(:grid_array) do 
        [ 
          [' x ', ' x ', ' o '],
          [' o ', ' o ', ' x '],
          [' x ', ' o ', ' x '] 
        ]
      end
      subject(:grid) { Grid.new(grid_array) }
      let(:query) { Query.new(grid, false) }

      it 'returns a @won of false' do
        query.player_1 = player_one
        query.player_2 = player_two
        
        query.loop_until_win(grid)

        expect(player_one.won).to eq(false)
        expect(player_two.won).to eq(false)
      end
    end
  end
end



