class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :team

def self.user_profiles(user)
  where(user_id: user)
end


end
