# == Schema Information
#
# Table name: profiles
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  offense       :string(255)
#  defense       :string(255)
#  notes         :text
#  team_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#  hfa           :float
#  power_ranking :float
#

class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

  def self.user_profiles(user)
    where(user_id: user)
  end

end
