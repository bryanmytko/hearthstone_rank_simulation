module HearthstoneRanks
  class Games

    def initialize(winrate)
      @winrate = winrate
    end

    def random_outcome
      n = case rand*100
        when 0...@winrate then 1
        when @winrate..100 then 0
      end
    end

  #def game_won
  #  @total_games_won += 1 
  #  @stars += 1
  #  @streak += 1
  #  #bonus stars for winning streak
  #  if((@streak >= STREAK_WINS_START ) && (@rank > STREAK_RANK_END))
  #    @stars += 1
  #  end
  #  #rank up
  #  if(@stars >= @@ranks[0][@rank])
  #    @stars = @stars - @@ranks[0][@rank]
  #    @rank -= 1
  #  end
  #end

  #def game_lost
  #  @streak = 0
  #  #we don't always lose stars
  #  if(@rank < MIN_RANK_LOSE_STARS)
  #    if(@stars > 0)
  #      @stars -= 1
  #    end
  #    #rank down
  #    if(@stars == 0)
  #      @rank += 1
  #      @stars = @@ranks[0][@rank]
  #    end
  #  end
  #end

  #def display_output
  #  puts "It took you " + @total_games_played.to_s + " games to reach Legend rank."
  #  losses = @total_games_played - @total_games_won
  #  puts "Win / Loss ratio: " + @total_games_won.to_s + "/" + losses.to_s + "\n"
  #end

  #def start_playing
  #  while @rank > 0
  #    @total_games_played += 1 
  #    if(random_game_outcome)
  #      game_won
  #    else
  #      game_lost
  #    end 
  #  end
  #  #display_output
  #  @total_games_played
  #end
  end
end
