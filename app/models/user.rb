class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :profiles, :dependent => :destroy
  has_many :spreads, :dependent => :destroy
  accepts_nested_attributes_for :spreads, :reject_if => lambda { |b| b[:proj_spread].blank? }

  after_create :create_profiles, :create_spreads

  private

  def create_profiles
    @teams = Team.all
    @teams.each do |team|
      unless team.name == "FCS Team"
        Profile.create(user_id: self.id, team_id: team.id, hfa: 0, power_ranking: 0)
      end
    end
  end

  def create_spreads
    @games = Game.all
    @games.each do |game|
      Spread.create(user_id: self.id, game_id: game.id)
    end
  end

end

