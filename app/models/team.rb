# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  conference :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Team < ActiveRecord::Base
  has_many :profiles
  has_many :games_as_visitor, class_name: "Game", foreign_key: "visitor_id"
  has_many :games_as_home, class_name: "Game", foreign_key: "home_id"

  require 'csv'

  def self.import()
    agent = Mechanize.new
    stuff = agent.get("https://en.wikipedia.org/wiki/List_of_NCAA_Division_I_FBS_football_programs").search(".wikitable")
    data = stuff.map do |node|
      node.children.map{|n| [n.text.strip] if n.elem? }.compact
    end
    data = data[0]
    data.each do |x|
      unless x[0].split("\n")[0] == "Team"
        Team.create(name: x[0].split("\n")[0], conference: x[0].split("\n")[4])
      end
    end
  end

  def has_profile?(user)
   profiles.where("user_id = ? AND power_ranking > 0", user.id).any?
  end

  def games
    (games_as_visitor + games_as_home).sort_by &:date
  end

end
