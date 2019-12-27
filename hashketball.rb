require 'pry'

# Write your code here!
def game_hash
{
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
    ]
  }
}
end

def num_points_scored(players_name)
  game_hash.each {|place, team| 
    team.each {|attribute, data| 
      if attribute == :players
        data.each {|player|
          if player[:player_name] == players_name
            return player[:points]
          end
        }
      end 
    }
  }
end 

def shoe_size(players_name)
  game_hash.each {|place, team| 
    team.each {|attribute, data| 
      if attribute == :players
        data.each {|player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        }
      end 
    }
  }
end 

def team_colors(team_name)
  game_hash.each{|place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end 
  }
end

def team_names
  game_hash.map{|place, team|
    team[:team_name]
  }
end

def player_numbers(team_name)
  nums = []
  game_hash.each {|place, team|
    if team[:team_name] == team_name
      team.each{|attribute, data|
        if attribute == :players
          data.each {|player|
            nums << player[:number]
          }
        end 
      }
    end 
  }
  nums
end  

def player_stats(players_name)
  new_hash = {}
  game_hash.each {|place, team|
    team.each {|attribute,data|
      if attribute == :players
        data.each {|player|
          if player[:player_name] == players_name
            new_hash = player.delete_if {|delete_this, bob|
              delete_this == :player_name
            }
          end 
        }
      end 
    }
  }
  new_hash
end  

def big_shoe_rebounds
  players_list = ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry" "Jeff Adrien", "Bismack Biyombo", "DeSagna Diop", "Ben Gordon", "Kemba Walker"]
  new_array = []
  game_hash.each {|place, team|
    team.each {|attribute, data|
      if attribute == :players
        data.each {|player|
          new_array << player[:shoe]
        }
      end 
    }
  }
  
  big_foot_guy = players_list[new_array.each_with_index.max[1]]
  game_hash.each{|place, team|
    team.each {|attribute, data|
      if attribute == :players
        data.each{|player|
          if player[:player_name] == big_foot_guy
            return player[:rebounds]
          end
        }
      end  
    }
  }
end

def most_points_scored
  players_list = ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry", "Jeff Adrien", "Bismack Biyombo", "DeSagna Diop", "Ben Gordon", "Kemba Walker"]
  new_array = []
  game_hash.each {|place, team|
    team.each {|attribute, data|
      if attribute == :players
        data.each {|player|
          new_array << player[:points]
        }
      end 
    }
  }

  hot_shot_guy = players_list[new_array.each_with_index.max[1]]
  game_hash.each{|place, team|
    team.each {|attribute, data|
      if attribute == :players
        data.each{|player|
          if player[:player_name] == hot_shot_guy
            return player[:player_name]
          end
        }
      end  
    }
  }
end  

def winning_team 
  teams = ["Brooklyn Nets", "Charlotte Hornets"]
  nets_array = []
  game_hash.each {|place, team|
    if team[:team_name] == "Brooklyn Nets"
      team.each{|attribute, data|
        if attribute == :players
          data.each{|player|
            nets_array << player[:points]
          }
        end 
      }
    end 
  }
  
  nets = nets_array.sum
  
  
  hornets_array = []
  game_hash.each {|place, team|
    if team[:team_name] == "Charlotte Hornets"
      team.each{|attribute, data|
        if attribute == :players
          data.each{|player|
            hornets_array << player[:points]
          }
        end 
      }
    end 
  }
  hornets = hornets_array.sum
  
  if hornets > nets
    return "Charlotte Hornets"
  else 
    return "Brooklyn Nets"
  end
end  

def player_with_longest_name
  new_array = []
  game_hash.each {|place, team|
    team.each {|attribute, data|
      if attribute == :players
        data.each {|player|
          new_array << player[:player_name]
        }
      end 
    }
  }
  new_array.sort_by(&:length).last
end

def long_name_steals_a_ton?
  true  
end 
