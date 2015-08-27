# == Schema Information
#
# Table name: spreads
#
#  id                  :integer          not null, primary key
#  game_id             :integer
#  user_id             :integer
#  proj_spread         :float
#  proj_total          :float
#  created_at          :datetime
#  updated_at          :datetime
#  home_win_percentage :float
#

class Spread < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def self.simulate game1, game2, game3, game4, game5, game6, game7, game8, game9, game10, game11, game12, game13
    results_array = []
    10000.times do
      win_counter = 0
      win_counter += 1 if sim_one_game game1.to_f
      win_counter += 1 if sim_one_game game2.to_f
      win_counter += 1 if sim_one_game game3.to_f
      win_counter += 1 if sim_one_game game4.to_f
      win_counter += 1 if sim_one_game game5.to_f
      win_counter += 1 if sim_one_game game6.to_f
      win_counter += 1 if sim_one_game game7.to_f
      win_counter += 1 if sim_one_game game8.to_f
      win_counter += 1 if sim_one_game game9.to_f
      win_counter += 1 if sim_one_game game10.to_f
      win_counter += 1 if sim_one_game game11.to_f
      win_counter += 1 if sim_one_game game12.to_f
      win_counter += 1 if sim_one_game game13.to_f
      results_array << win_counter
    end
    results_array.each_with_object(Hash.new(0)) { |wins,counts| counts[wins] += 1 }
  end

  def self.sim_one_game odds
    return true if odds > rand(0.0..100)
    false
  end

end
