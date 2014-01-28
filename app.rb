class HSRanking
  @winrate = 0
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
	end

  def puts(string)
  end

	def random_game_outcome
		n = case rand*100
		when 0...@winrate then 1
		when @winrate..100 then 0
		end
		n
	end

  def init
		streak = 0
		stars = 0
		rank = 25
    total_games_played = 0
    total_games_won = 0
    puts "\n"
    while rank > 0
      outcome = random_game_outcome
      total_games_played += 1 
      if(outcome == 1)
        total_games_won += 1 
        puts "Won a game!"
        stars += 1
        streak += 1
        if((streak >= 3) && (rank > 5))
          stars += 1
        end
        if(stars >= @@ranks[0][rank])
          stars = stars - @@ranks[0][rank]
          rank -= 1
        end
        if(rank > 0)
					puts "Currently Rank: " + rank.to_s
					puts "(" + stars.to_s + "/" + @@ranks[0][rank].to_s + ")"
        end
      else
        puts "Sorry, you lost a game"
        streak = 0
        if(rank < 20)
          if(stars > 0)
            stars -= 1
          end
          if(stars == 0)
            puts "going down a rank..."
            rank += 1
            stars = @@ranks[0][rank]
            puts "You've been demoted to rank " + rank.to_s
          end
        end
      end 
    end
    puts "-----------------------------"
    puts "Congrats, you achieved Legend!"
    puts "It took you " + total_games_played.to_s + " games."
    losses = total_games_played - total_games_won
    puts "Win / Loss ratio: " + total_games_won.to_s + "/" + losses.to_s
    total_games_played
  end
end

puts "Winrate: "
winrate = gets.to_i
puts "Sample Size: "
sample = gets.to_i

g = HSRanking.new(winrate)
num = 0
games = sample.times.collect { g.init }
games.each { |a| num += a }


puts "Average required wins at " + winrate.to_s + "% win rate: " + (num/sample).to_s + " games."
