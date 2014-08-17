require_relative '../lib/hearthstoneranks/config'
require_relative '../lib/hearthstoneranks/games'

describe HearthstoneRanks::Games do
  context 'Simulating Games' do
    it 'can simulate a game' do
      winrate = 50
      expect(HearthstoneRanks::Games.new(winrate).random_outcome).to be_between(0,1)
    end

    it 'can simulate a win' do
      winrate = 100
      expect(HearthstoneRanks::Games.new(winrate).random_outcome).to eq(1)
    end

    it 'can simulate a loss' do
      winrate = 0
      expect(HearthstoneRanks::Games.new(winrate).random_outcome).to eq(0)
    end

    it 'can simulate a season' do
      winrate = 90
      games = HearthstoneRanks::Games.new(winrate)
      expect(games.start_season).to be_kind_of(Integer)
    end

    it 'can simulate multiple seasons' do
      winrate = 50
      games_to_play = 500
      season = HearthstoneRanks::Games.new(winrate)
      expect(games.start_season).to be_kind_of(Integer)
    end
  end
end
