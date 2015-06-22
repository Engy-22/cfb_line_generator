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

end
