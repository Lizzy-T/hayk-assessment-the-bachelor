require "pry"

def get_first_name_of_season_winner(data, season)
  winning_contestant = data[season].find {|contestant| contestant["status"] == "Winner"}
  winning_contestant["name"].split.first
end



def get_contestant_name(data, occupation)
  contestant_occupation = data.reduce ({}) do |memo, (season, season_contestants)|
      lady = season_contestants.find {|contestant| contestant["occupation"] == occupation}
      memo = lady if lady
      memo
    end
    contestant_occupation["name"]
end


def count_contestants_by_hometown(data, hometown)
  data.reduce (0) do |n, (season, contestants)| 
      n += contestants.find_all{|contestant| contestant["hometown"] ==  hometown}.count
  end
end

def get_occupation(data, hometown)
  contestant_occupation = data.reduce ({}) do |memo, (season, season_contestants)|
    lady = season_contestants.find {|contestant| contestant["hometown"] == hometown}
    memo = lady if lady
    memo
  end
  contestant_occupation["occupation"]
end

def get_average_age_for_season(data, season)
  combined_age = data[season].map {|contestant| contestant["age"].to_i}
  (combined_age.reduce(:+)/(Float(combined_age.length))).round
end
