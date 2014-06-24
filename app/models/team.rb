class Team < ActiveRecord::Base
  has_many :profiles
  has_many :games_as_visitor, class_name: "Game", foreign_key: "visitor_id"
  has_many :games_as_home, class_name: "Game", foreign_key: "home_id"


  require 'csv'

  def self.import()
    CSV.foreach('cfbteams.csv') do |row|
      record = Team.new(
        :name => row[0],
        :conference => row[1]
      )
    record.save!
    end
  end

  def has_profile?(user)
   profiles.where("user_id = ? AND power_ranking > 0", user.id).any?
  end

end
