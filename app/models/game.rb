class Game < ActiveRecord::Base
  belongs_to :visitor, class_name: "Team"
  belongs_to :home, class_name: "Team"
  has_many :spreads

  def has_spread?(user)
    spreads.where(user_id: user.id).any?
  end

  def has_profile?(user)
   profiles.where("user_id = ? AND power_ranking > 0", user.id).any?
  end


  require 'csv'

  def self.import()
    CSV.foreach('cfbschedule.csv') do |row|
      record = Game.new(
        :visitor_id => row[0],
        :home_id => row[1],
        :visitor_rot => row[2],
        :home_rot => row[3],
        :neutral => row[4],
        :visitor_score => row[5],
        :home_score => row[6],
        :closing_spread => row[7],
        :date => row[8],
        :created_at => row[9],
        :updated_at => row[10]
      )
    record.save!
    end
  end

end
