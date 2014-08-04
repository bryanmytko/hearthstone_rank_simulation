module HearthstoneRanks
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  class Configuration
    attr_accessor :win_streak, :rank_streak_ends, :streak_bonus,
                  :min_rank_lose, :ranks

    def initialize
      self.win_streak = 3
      self.rank_streak_ends = 5
      self.streak_bonus = 1
      self.min_rank_lose = 20
      self.ranks = [
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
    end

    def self.configuration
    end

  end
end
