class SpreadsController < ApplicationController

def create
    @spread = Spread.new(spread_params)
    @spread.user = current_user
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
  end
end

private

  def spread_params
    params.require(:spread).permit(:proj_spread, :proj_total, :game_id)
  end


end
