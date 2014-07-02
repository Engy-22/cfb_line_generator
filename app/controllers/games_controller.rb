class GamesController < ApplicationController

  def wk1
    @games = Game.where(:date => ("2014-08-27").."2014-09-01").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk2
    @games = Game.where(:date => ("2014-09-02").."2014-09-08").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk3
    @games = Game.where(:date => ("2014-09-09").."2014-09-15").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk4
    @games = Game.where(:date => ("2014-09-16").."2014-09-22").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk5
    @games = Game.where(:date => ("2014-09-23").."2014-09-29").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk6
    @games = Game.where(:date => ("2014-09-30").."2014-10-06").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk7
    @games = Game.where(:date => ("2014-10-07").."2014-10-13").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk8
    @games = Game.where(:date => ("2014-10-14").."2014-10-20").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk9
    @games = Game.where(:date => ("2014-10-21").."2014-10-27").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk10
    @games = Game.where(:date => ("2014-10-28").."2014-11-03").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk11
    @games = Game.where(:date => ("2014-11-04").."2014-11-10").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk12
    @games = Game.where(:date => ("2014-11-11").."2014-11-17").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk13
    @games = Game.where(:date => ("2014-11-18").."2014-11-24").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk14
    @games = Game.where(:date => ("2014-11-25").."2014-12-01").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

  def wk15
    @games = Game.where(:date => ("2014-12-02").."2014-12-14").order('date').order('visitor_rot')
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end
end

#@results = @games.map do |game|
     # thing = BusinessLogicThing.new(current_user, game.home, game.visitor)
      #thing.calculate_result
    #end
