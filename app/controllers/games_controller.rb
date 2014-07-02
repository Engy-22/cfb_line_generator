class GamesController < ApplicationController

  def index
    @games = Game.all.order('date').order('visitor_rot').page(params[:page])

    #@results = @games.map do |game|
     # thing = BusinessLogicThing.new(current_user, game.home, game.visitor)
      #thing.calculate_result
    #end

    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

end
