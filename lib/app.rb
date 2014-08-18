require_relative 'hearthstoneranks/games'
require_relative 'hearthstoneranks/config'
require 'debugger'

class Simulator
  include HearthstoneRanks

  attr_accessor :seasons, :winrate, :total

  def initialize
    @total = 0
    puts "Winrate (%)?"
    @winrate = gets.to_i
    puts "Sample Size? (How many Legendary runs?) "
    @seasons = gets.to_i
  end

  def run
    seasons.times do
      # move this out #wwsmd
      game = Games.new(winrate)
      total += game.start_season
    end
    calculate_average
  end

  private

  def calculate_average
    total / seasons
  end
end


simulator = Simulator.new

puts simulator.run
