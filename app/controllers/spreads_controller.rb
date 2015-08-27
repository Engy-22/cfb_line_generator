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
    @teams = Team.where.not(conference: nil).order("name")
    @spreads = Spread.all.where(user_id: current_user.id)
    @counter = 0
  end

  def simulator
    if params["game_one"].present?
      @results = Spread.simulate params["game_one"], params["game_two"], params["game_three"],
       params["game_four"], params["game_five"], params["game_six"], params["game_seven"],
       params["game_eight"], params["game_nine"], params["game_ten"], params["game_eleven"], params["game_twelve"], params["game_thirteen"]
    end
  end

private

  def spread_params
    params.require(:spread).permit(:proj_spread, :proj_total, :game_id)
  end

end
