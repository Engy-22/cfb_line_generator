# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  visitor_id     :integer
#  home_id        :integer
#  visitor_rot    :integer
#  home_rot       :integer
#  neutral        :boolean          default(FALSE)
#  visitor_score  :integer
#  home_score     :integer
#  closing_spread :float
#  date           :date
#  created_at     :datetime
#  updated_at     :datetime
#

class Game < ActiveRecord::Base
  belongs_to :visitor, class_name: "Team"
  belongs_to :home, class_name: "Team"
  has_many :spreads, dependent: :destroy

  def self.import_schedule
    agent = Mechanize.new
    stuff = agent.get("http://www.lsufootball.net/tvschedule.htm").search(".tabdata")
    data = stuff.map do |node|
      node.children.map{|n| [n.text.strip] if n.elem? }.compact
    end
    manual = []
    day = ""
    data = data[0]
    (4..950).each do |n|
      if data[n][0].split(",")[0] == "Saturday" || data[n][0].split(",")[0] == "Sunday" || data[n][0].split(",")[0] == "Monday" || data[n][0].split(",")[0] == "Tuesday" || data[n][0].split(",")[0] == "Wednesday" || data[n][0].split(",")[0] == "Thursday" || data[n][0].split(",")[0] == "Friday"
        day = data[n][0]
      elsif data[n][0].include? "game"
      elsif data[n][0].include? " vs. "
        Game.create(visitor_id: Team.where(name: data[n][0].split(" vs. ")[0]).first_or_create.id, home_id: Team.where(name: data[n][0].split(" vs. ")[1].split(" (")[0]).first_or_create.id, date: day.to_date, neutral: true)
      elsif data[n][0].include? " at "
        Game.create(visitor_id: Team.where(name: data[n][0].split(" at ")[0]).first_or_create.id, home_id: Team.where(name: data[n][0].split(" at ")[1].split("\n")[0]).first_or_create.id, date: day.to_date)
      else
        manual << data[n][0]
      end
    end
    manual
  end

  def has_spread?(user)
    spreads.where(user_id: user.id).any?
  end

  def has_profile?(user)
   profiles.where("user_id = ? AND power_ranking > 0", user.id).any?
  end

  private

  require 'csv'

  def self.import()
    CSV.foreach('cfbschedule.csv') do |row|
      record = Game.new(
        visitor_id: row[0],
        home_id: row[1],
        visitor_rot: row[2],
        home_rot: row[3],
        neutral: row[4],
        visitor_score: row[5],
        home_score: row[6],
        closing_spread: row[7],
        date: row[8],
        created_at: row[9],
        updated_at: row[10]
      )
    record.save!
    end
  end

  def self.create_spreads
    @users = User.all
    @users.each do |user|
      @games = Game.all
      @games.each do |game|
        unless Spread.where(game_id: game.id, user_id: user.id).any?
          Spread.create(game_id: game.id, user_id: user.id)
        end
      end
    end
  end

end
