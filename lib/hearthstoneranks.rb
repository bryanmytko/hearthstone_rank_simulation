module HearthstoneRanks
  class Application
    def initialize
    end

#
#  def initialize(winrate)
#    @winrate = winrate
#    @rank = 25
#    @streak = 0
#    @stars = 0
#    @total_games_played = 0
#    @total_games_won = 0
#  end
#
##hide the output for large data sets
##def puts(string)
##end
##get user input; winrate and how many legendary trips
#puts "Winrate (%)?"
#winrate = gets.to_i
#puts "Sample Size? (How many Legendary runs?) "
#sample = gets.to_i
#
#num = 0
#sample.times do
#  g = HSRanking.new(winrate)
#  num += g.start_playing
#end
#
#puts "Average required games at " + winrate.to_s + "% win rate: " + (num/sample).to_s + " games."
  end
end
