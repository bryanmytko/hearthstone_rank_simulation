require_relative 'hearthstoneranks/games'
require_relative 'hearthstoneranks/config'

class Simulator
  include HearthstoneRanks

  def initialize(winrate, seasons)
    @seaasons = seasons
    @game = Games.new(winrate)
  end

  def play_seasons
    @game.start_season
  end
end

#get user input; winrate and how many legendary trips
puts "Winrate (%)?"
winrate = gets.to_i
puts "Sample Size? (How many Legendary runs?) "
seasons = gets.to_i

simulator = Simulator.new(winrate, seasons)

puts simulator.play_seasons
