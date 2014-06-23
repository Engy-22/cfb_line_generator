class Game < ActiveRecord::Base
  belongs_to :visitor, class_name: "Team"
  belongs_to :home, class_name: "Team"
  has_many :spreads

  def has_spread?(user)
    spreads.where(user_id: user.id).any?
  end

  def has_profile?(user)
    profiles.where(user_id: user.id).any?
  end

end
