class HSRanking

  STREAK_WINS_START = 3
  STREAK_RANK_END = 5
  STREAK_EXTRA_STARS = 1
  MIN_RANK_LOSE_STARS = 20

  @@ranks = [
		25 => 2,
		24 => 2,
		23 => 2,
		22 => 2,
		21 => 2,
		20 => 3,
		19 => 3,
		18 => 3,
		17 => 3,
		16 => 3,
		15 => 4,
		14 => 4,
		13 => 4,
		12 => 4,
		11 => 4,
		10 => 5,
		9 => 5,
		8 => 5,
		7 => 5,
		6 => 5,
		5 => 5,
		4 => 5,
		3 => 5,
		2 => 5,
		1 => 5
  ]

  def initialize(winrate)
		@winrate = winrate
		@rank = 25
		@streak = 0
		@stars = 0
		@total_games_played = 0
		@total_games_won = 0
	end

  #hide the output for large data sets
  #def puts(string)
  #end

	def random_game_outcome
		n = case rand*100
		when 0...@winrate then 1
		when @winrate..100 then nil
		end
		n
	end

  def game_won
		@total_games_won += 1 
		@stars += 1
		@streak += 1
    #bonus stars for winning streak
		if((@streak >= STREAK_WINS_START ) && (@rank > STREAK_RANK_END))
			@stars += 1
		end
    #rank up
		if(@stars >= @@ranks[0][@rank])
			@stars = @stars - @@ranks[0][@rank]
			@rank -= 1
		end
  end

  def game_lost
		@streak = 0
    #we don't always lose stars
		if(@rank < MIN_RANK_LOSE_STARS)
			if(@stars > 0)
				@stars -= 1
			end
      #rank down
			if(@stars == 0)
				@rank += 1
				@stars = @@ranks[0][@rank]
			end
		end
  end

  def display_output
    puts "It took you " + @total_games_played.to_s + " games to reach Legend rank."
    losses = @total_games_played - @total_games_won
    puts "Win / Loss ratio: " + @total_games_won.to_s + "/" + losses.to_s + "\n"
  end

  def start_playing
    while @rank > 0
      @total_games_played += 1 
      if(random_game_outcome)
        game_won
      else
        game_lost
      end 
    end
    #display_output
    @total_games_played
  end
end

#get user input; winrate and how many legendary trips
puts "Winrate (%)?"
winrate = gets.to_i
puts "Sample Size? (How many Legendary runs?) "
sample = gets.to_i

num = 0
sample.times do
  g = HSRanking.new(winrate)
  num += g.start_playing
end

puts "Average required wins at " + winrate.to_s + "% win rate: " + (num/sample).to_s + " games."
