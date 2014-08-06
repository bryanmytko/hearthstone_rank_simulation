require_relative 'hearthstoneranks/hearthstoneranks'

class Simulator
  include HearthstoneRanks
  def initialize(winrate, seasons)
    game = Games.new(winrate)
  end
end

#get user input; winrate and how many legendary trips
puts "Winrate (%)?"
winrate = gets.to_i
puts "Sample Size? (How many Legendary runs?) "
seasons = gets.to_i

simulator = Simulator.new(winrate, seasons)

#num = 0
#sample.times do
#  g = HSRanking.new(winrate)
#  num += g.start_playing
#end
#
#puts "Average required games at " + winrate.to_s + "% win rate: " + (num/sample).to_s + " games."
#
#
  #def display_output
  #  puts "It took you " + @total_games_played.to_s + " games to reach Legend rank."
  #  losses = @total_games_played - @total_games_won
  #  puts "Win / Loss ratio: " + @total_games_won.to_s + "/" + losses.to_s + "\n"
  #end
