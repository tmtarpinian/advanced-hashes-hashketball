require 'pry'
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(name)
  game_hash.each do |status, team| 
    team[:players].each do |player|
      if player[:player_name] == name
        return player[:points]
      end
    end
  end
end


def shoe_size(name)
  game_hash.each do |status, team| 
    team[:players].each do |player|
      if player[:player_name] == name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |status, team| 
      if team[:team_name] == team_name
        return team[:colors]
      end
  end
end

def team_names
  teams = []
  game_hash.each do |status, team|
    teams << team[:team_name]
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |status, team|
    if team[:team_name] == team_name
      team[:players].each do |player|
        numbers << player[:number]
      end
    end
  end
  numbers
end

def player_stats(name)
  counter = 0
  game_hash.each do |status, team| 
    team[:players].each do |player|
      if player[:player_name] == name
        return team[:players][counter]
      end
      counter +=1
    end
    counter = 0
  end
end

def big_shoe_rebounds
  shoe_size = 0
  player_name = ""

  game_hash.each do |status, team| 
    team[:players].each do |player|
      if player[:shoe] > shoe_size
        shoe_size = player[:shoe]
        player_name = player[:player_name]
      end
    end
  end
  #now utilizing a helper method
  num_rebounds(player_name)
end


#helper method
def num_rebounds(name)
  game_hash.each do |status, team| 
    team[:players].each do |player|
      if player[:player_name] == name
        return player[:rebounds]
      end
    end
  end
end


# Bonus Questions
def most_points_scored
  points = 0
  player_name = ""

  game_hash.each do |status, team| 
    team[:players].each do |player|
      if player[:points] > points
        points = player[:points]
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

def winning_team
  home = 0
  away = 0
  game_hash.each do |status, team|
    if home == 0
      team[:players].each do |player|
        home += player[:points]
    end
    elsif home != 0 && away == 0
      team[:players].each do |player|
        away += player[:points]
      end
    end
  end
  home > away ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end


def player_with_longest_name
  length = 0
  player_name = ""

  game_hash.each do |status, team| 
    team[:players].each do |player|
      if player[:player_name].length > length
        length = player[:player_name].length
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

# Super Bonus Question
def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  stealingest_player = most_steals
  longest_name == stealingest_player
end

#helper method
def most_steals
  steals = 0
  player_name = ""

  game_hash.each do |status, team| 
    team[:players].each do |player|
      if player[:steals] > steals
        steals = player[:steals]
        player_name = player[:player_name]
      end
    end
  end
  player_name
end