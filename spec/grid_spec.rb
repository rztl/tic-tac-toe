require './lib/grid'
require './lib/player'

describe Grid do
  
  describe '#check_for_win' do
    let(:player) { Player.new }
  
    context 'when XXX on first row' do
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

    context 'when XXX on second row' do
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

    context 'when XXX on third row' do
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
  end
end



