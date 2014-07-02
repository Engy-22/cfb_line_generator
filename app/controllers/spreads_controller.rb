class SpreadsController < ApplicationController

def create
    @spread = Spread.new(spread_params)
    @spread.user = current_user
    get_win_percentage
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
  get_win_percentage
  @spread.save
  end
end

private

  def spread_params
    params.require(:spread).permit(:proj_spread, :proj_total, :game_id)
  end

  def get_win_percentage
    @spread.home_win_percentage =  case @spread.proj_spread
    when -1000..-41.5
      0.9999
    when -41.499..-28.5
      0.999
    when -28
      0.99
    when -27.5
      0.99
    when -27
      0.99
    when -26.5
      0.99
    when -26
      0.99
    when -25.5
      0.99
    when -25
      0.99
    when -24.5
      0.99
    when -24
      0.99
    when -23.5
      0.99
    when -23
      0.99
    when -22.5
      0.99
    when -22
      0.99
    when -21.5
      0.99
    when -21
      0.99
    when -20.5
      0.99
    when -20
      0.99
    when -19.5
      0.99
    when -19
      0.99
    when -18.5
      0.99
    when -18
      0.57
    when -17.5
      0.55
    when -17
      0.99
    when -16.5
      0.99
    when -16
      0.99
    when -15.5
      0.99
    when -15
      0.99
    when -14.5
      0.99
    when -14
      0.99
    when -13.5
      0.99
    when -13
      0.99
    when -12.5
      0.99
    when -12
      0.99
    when -11.5
      0.99
    when -11
      0.99
    when -10.5
      0.99
    when -10
      0.99
    when -9.5
      0.99
    when -9
      0.99
    when -8.5
      0.99
    when -8
      0.99
    when -7.5
      0.99
    when -7
      0.99
    when -6.5
      0.99
    when -6
      0.99
    when -5.5
      0.99
    when -5
      0.99
    when -4.5
      0.99
    when -4
      0.99
    when -3.5
      0.99
    when -3
      0.99
    when -2.5
      0.99
    when -2
      0.99
    when -1.5
      0.99
    when -1
      0.99
    when -0
      0.99
    when 1
      0.99
    when 1.5
      0.99
    when 2
      0.99
    when 2.5
      0.99
    when 3
      0.99
    when 3.5
      0.99
    when 4
      0.99
    when 4.5
      0.99
    when 5
      0.99
    when 5.5
      0.99
    when 6
      0.99
    when 6.5
      0.99
    when 7
      0.99
    when 7.5
      0.99
    when 8
      0.99
    when 8.5
      0.99
    when 9
      0.99
    when 9.5
      0.99
    when 10
      0.99
    when 11.5
      0.99
    when 12
      0.99
    when 13.5
      0.99
    when 14
      0.99
    when 14.5
      0.99
    when 15
      0.99
    when 15.5
      0.99
    when 16
      0.99
    when 16.5
      0.99
    when 17
      0.99
    when 17.5
      0.99
    when 18
      0.99
    when 18.5
      0.99
    when 19
      0.99
    when 19.5
      0.99
    when 20
      0.99
    when 20.5
      0.99
    when 21
      0.99
    when 21.5
      0.99
    when 22
      0.99
    when 22.5
      0.99
    when 23
      0.99
    when 23.5
      0.99
    when 24
      0.99
    when 24.5
      0.99
    when 25
      0.99
    when 25.5
      0.99
    when 26
      0.99
    when 26.5
      0.99
    when 27
      0.99
    when 27.5
      0.01
    when 28
      0.005
    when 28.5..41
      0.001
    when 41.0001..1000
      0.0001
    else
      redirect_to :back and return
    end
  end


end
