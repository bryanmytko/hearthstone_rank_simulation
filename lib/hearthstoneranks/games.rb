module HearthstoneRanks
  class Games

    def initialize(winrate)
      config = HearthstoneRanks::Configuration.new

      @streak_start = config.streak_start
      @streak_bonus = config.streak_bonus
      @rank_streak_ends = config.rank_streak_ends
      @min_rank_lose = config.min_rank_lose
      @ranks = config.ranks

      @rank = 25
      @total_games_played = 0
      @total_games_won = 0
      @stars = 0
      @streak = 0

      @winrate = winrate
    end

    def random_outcome
      n = case rand*100
        when 0...@winrate then 1
        when @winrate..100 then 0
      end
    end

    def game_won
      @total_games_won += 1
      @stars += 1
      @streak += 1
      #bonus stars for winning streak
      if((@streak >= @streak_start) && (@rank > @rank_streak_ends))
        @stars += 1
      end
      #rank up
      if(@stars >= @ranks[0][@rank])
        @stars = @stars - @ranks[0][@rank]
        @rank -= 1
      end
    end

    def game_lost
     @streak = 0
     #we don't always lose stars
     if(@rank < @min_rank_lose)
       if(@stars > 0)
         @stars -= 1
       end
       #rank down
       if(@stars == 0)
         @rank += 1
         @stars = @ranks[0][@rank]
       end
     end
    end

    def start_season
      #TODO should put a check in here for too many games, i.e., too low a win %
      while @rank > 0
        @total_games_played += 1
        (random_outcome == 1) ? game_won : game_lost
      end
      @total_games_played
    end
  end
end
