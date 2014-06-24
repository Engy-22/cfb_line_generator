class GamesController < ApplicationController

  def index
    @games = Game.all.order('date').page(params[:page])
    respond_to do |format|
      format.html
      format.json {render :json => @games}
    end
  end

end
