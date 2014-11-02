class GamesController < ApplicationController

  def week
    render_games_for_week(week_number)
  end

  protected

  def week_number
    params[:week_number].try(:to_i)
  end

  def date_range_for_week(week_number)
    start_date = end_date = nil
    if week_number == 1
      start_date = Date.new(2014, 8, 27)
      end_date = Date.new(2014, 9, 1)
    elsif week_number == 15
      start_date = Date.new(2014, 12, 2)
      end_date = Date.new(2014, 12, 14)
    elsif week_number == 16
      start_date = Date.new(2014,12, 15)
      end_date = Date.new(2015, 1, 15)
    else
      start_date = Date.new(2014, 9, 2) + (week_number - 2).weeks
      end_date = start_date + 1.week
    end
    start_date..end_date
  end

  def render_games_for_week(week_number)

    range = date_range_for_week(week_number)
    @games = Game.where(:date => range).order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end
end
