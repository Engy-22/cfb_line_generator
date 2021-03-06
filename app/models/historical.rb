# == Schema Information
#
# Table name: historicals
#
#  id         :integer          not null, primary key
#  year       :integer
#  home_team  :string(255)
#  away_team  :string(255)
#  spread     :float
#  total      :float
#  h1q        :integer
#  h2q        :integer
#  h3q        :integer
#  h4q        :integer
#  hot        :integer
#  hscore     :integer
#  a1q        :integer
#  a2q        :integer
#  a3q        :integer
#  a4q        :integer
#  aot        :integer
#  ascore     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Historical < ActiveRecord::Base

  require 'csv'

  def self.import(file)
    games = CSV.read(file)
    games.each do |row|
        year = row[0]
        home_team = row[1]
        away_team = row[2]
        spread = row[3]
        total = row[4]
        h1q = row[5]
        h2q = row[6]
        h3q = row[7]
        h4q = row[8]
        hot = row[9]
        a1q = row[10]
        a2q = row[11]
        a3q = row[12]
        a4q = row[13]
        aot = row[14]
        Historical.create(year: year, home_team: home_team, away_team: away_team,
         spread: spread, total: total, h1q: h1q, h2q: h2q, h3q: h3q, h4q: h4q, hot: hot,
          a1q: a1q, a2q: a2q, a3q: a3q, a4q: a4q, aot: aot,
          hscore: h1q.to_i + h2q.to_i + h3q.to_i + h4q.to_i + hot.to_i,
          ascore: a1q.to_i + a2q.to_i + a3q.to_i + a4q.to_i + aot.to_i  )
    end
  end

  def self.win_percentage(spread)
    games = Historical.where(spread: spread)
    wins = games.where("hscore > ascore").count / games.count.to_f
    if wins.class == Float
      wins.round(3)
    else
      wins
    end
  end

  def self.combine_home_and_away(spread)
    home_fav = Historical.where(spread: spread)
    away_fav = Historical.where(spread: spread * -1)
    home_wins = home_fav.where("hscore > ascore").count
    away_wins = away_fav.where("ascore > hscore").count
    wins = (home_wins + away_wins) / (home_fav.count.to_f + away_fav.count.to_f)
    if wins.class == Float
      wins.round(3)
    else
      wins
    end
  end

  def self.check_spread(spread, line)
    games_w_spread = Historical.where(spread: spread)
    games_w_spread.where("hscore + spread + ? > ascore", line).count / games_w_spread.count.to_f
  end

  def self.check_total(total, line)
    games_w_total = Historical.where(total: total)
    games_w_total.where("hscore + ascore > ?", line).count / games_w_total.count.to_f
  end

  def self.check_1hspread(spread, fhline)
    games_w_spread = Historical.where(spread: spread)
    games_w_spread.where("h1q + h2q + ? > a1q + a2q", fhline).count / games_w_spread.count.to_f
  end

  def self.check_1htotal(total, fhline)
    games_w_total = Historical.where(total: total)
    games_w_total.where("h1q + h2q + a1q + a2q > ?", fhline).count / games_w_total.count.to_f
  end

  def self.check_1qspread(spread, fqline)
    games_w_spread = Historical.where(spread: spread)
    games_w_spread.where("h1q + ? > a1q", fqline).count / games_w_spread.count.to_f
  end

  def self.check_1qtotal(total, fqline)
    games_w_total = Historical.where(total: total)
    games_w_total.where("h1q + a1q > ?", fqline).count / games_w_total.count.to_f
  end

  def self.moneyline(win_percentage)
    if win_percentage == 1.0 or win_percentage == 0
      "Can't display"
    elsif win_percentage >= 0.5
      (-100 * win_percentage / (1 - win_percentage)).round(0)
    else
      "+" + ((100 - 100 * win_percentage) / win_percentage).round(0).to_s
    end
  end

  def self.spread_to_ml(spread)
    a = -2.0528710078450474E-01
    b = -1.3042085394173281E+01
    c = 2.4014104679738363E-01
    d = -7.9686927880022185E-03
    if spread == 0
      0.5
    elsif spread < 0
      temp = 1.0 / (1.0 + Math.exp(-1.0 * a * (spread - b))) ** c
      temp += d
      temp.round(3)
    else
      spread = spread * -1.0
      temp = 1.0 / (1.0 + Math.exp(-1.0 * a * (spread - b))) ** c
      temp += d
      (1 - temp).round(3)
    end
  end

end

