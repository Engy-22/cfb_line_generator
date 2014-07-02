module ApplicationHelper

  def get_spread
     if game.neutral == true
       game.visitor.profiles.find_by(user_id: current_user.id).power_ranking - game.home.profiles.find_by(user_id: current_user.id).power_ranking
     else
       game.visitor.profiles.find_by(user_id: current_user.id).power_ranking - game.home.profiles.find_by(user_id: current_user.id).power_ranking - game.home.profiles.find_by(user_id: current_user.id).hfa
     end
  end

end


