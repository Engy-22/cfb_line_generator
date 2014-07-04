class Spread < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  def get_season_win_total

  end

end
