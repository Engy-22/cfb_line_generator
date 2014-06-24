class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :profiles, :dependent => :destroy
  has_many :spreads, :dependent => :destroy

  after_create :create_profiles

  private

  def create_profiles
    @teams = Team.all
    @teams.each do |team|
      unless team.name == "FCS Team"
        Profile.create(user_id: self.id, team_id: team.id, hfa: 0, power_ranking: 0)
      end
    end
  end

end

