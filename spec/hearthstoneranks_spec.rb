require_relative '../lib/config'
require_relative '../lib/games'
require_relative '../lib/hearthstoneranks'


describe HearthstoneRanks do
  context 'Configuration' do
    HearthstoneRanks.configure do |config|
      config.win_streak = 10
    end
    it 'has an accessible configuration file' do
      expect(HearthstoneRanks.configuration.win_streak).to eq(10)
    end
  end

  context 'Simulating Games' do
    it 'can simulate a game' do
      winrate = 50
      game = HearthstoneRanks::Games.new(winrate)
      expect(game.random_outcome).to be_between(0,1)
    end
  end
end
