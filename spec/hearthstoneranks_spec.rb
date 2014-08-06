require_relative '../lib/hearthstoneranks/config'
require_relative '../lib/hearthstoneranks/games'

describe HearthstoneRanks do
  context 'Configuration' do
    HearthstoneRanks.configure do |config|
      config.win_streak = 10
    end
    it 'has an accessible configuration file' do
      expect(HearthstoneRanks.configuration.win_streak).to eq(10)
    end
  end

  context 'Games' do
    it 'has a Games class' do
      expect(HearthstoneRanks::Games).to be
    end
  end
end
