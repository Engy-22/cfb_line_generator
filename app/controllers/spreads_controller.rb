class SpreadsController < ApplicationController

  def create
    @spread = Spread.new(spread_params)
    @spread.user = current_user
    if @spread.proj_spread != nil
      @spread.home_win_percentage = Historical.spread_to_ml(@spread.proj_spread)
    end
    @spread.save
    redirect_to :back
  end

  def update
    @spread = Spread.find(params[:id])
    if @spread.update_attributes!(spread_params)
      respond_to do |format|
        format.html
        format.json {render :json => @spread}
      end
    @spread.home_win_percentage = Historical.spread_to_ml(@spread.proj_spread)
    @spread.save
    end
  end

  def win_totals
    @teams = Team.all
    @spreads = Spread.all.where(user_id: current_user.id)
    @counter = 0
  end

private

  def spread_params
    params.require(:spread).permit(:proj_spread, :proj_total, :game_id)
  end

end
