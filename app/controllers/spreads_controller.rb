class SpreadsController < ApplicationController

def create
    @spread = Spread.new(spread_params)
    @spread.user = current_user
    if @spread.proj_spread != nil
      get_win_percentage
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
      1.0
    when -41.499..-28.5
      0.995
    when -28
      0.99
    when -27.5
      0.9875
    when -27
      0.985
    when -26.5
      0.9825
    when -26
      0.98
    when -25.5
      0.9775
    when -25
      0.975
    when -24.5
      0.9725
    when -24
      0.97
    when -23.5
      0.9675
    when -23
      0.965
    when -22.5
      0.9625
    when -22
      0.96
    when -21.5
      0.9575
    when -21
      0.955
    when -20.5
      0.9525
    when -20
      0.95
    when -19.5
      0.945
    when -19
      0.94
    when -18.5
      0.935
    when -18
      0.9325
    when -17.5
      0.93
    when -17
      0.915
    when -16.5
      0.89
    when -16
      0.885
    when -15.5
      0.88
    when -15
      0.875
    when -14.5
      0.8675
    when -14
      0.85
    when -13.5
      0.835
    when -13
      0.83
    when -12.5
      0.825
    when -12
      0.815
    when -11.5
      0.805
    when -11
      0.80
    when -10.5
      0.7925
    when -10
      0.7725
    when -9.5
      0.755
    when -9
      0.75
    when -8.5
      0.7475
    when -8
      0.7375
    when -7.5
      0.73
    when -7
      0.7025
    when -6.5
      0.6775
    when -6
      0.665
    when -5.5
      0.6525
    when -5
      0.6425
    when -4.5
      0.6325
    when -4
      0.62
    when -3.5
      0.6075
    when -3
      0.575
    when -2.5
      0.5425
    when -2
      0.5325
    when -1.5
      0.525
    when -1
      0.5125
    when -0
      0.5
    when 1
      0.4875
    when 1.5
      0.475
    when 2
      0.4675
    when 2.5
      0.4575
    when 3
      0.425
    when 3.5
      0.3925
    when 4
      0.38
    when 4.5
      0.3675
    when 5
      0.3575
    when 5.5
      0.3475
    when 6
      0.335
    when 6.5
      0.3225
    when 7
      0.2975
    when 7.5
      0.27
    when 8
      0.2625
    when 8.5
      0.2525
    when 9
      0.25
    when 9.5
      0.245
    when 10
      0.2275
    when 10.5
      0.2075
    when 11
      0.2
    when 11.5
      0.195
    when 12
      0.185
    when 12.5
      0.175
    when 13
      0.17
    when 13.5
      0.165
    when 14
      0.15
    when 14.5
      0.1325
    when 15
      0.125
    when 15.5
      0.12
    when 16
      0.115
    when 16.5
      0.11
    when 17
      0.085
    when 17.5
      0.07
    when 18
      0.0675
    when 18.5
      0.065
    when 19
      0.06
    when 19.5
      0.055
    when 20
      0.05
    when 20.5
      0.0475
    when 21
      0.045
    when 21.5
      0.0425
    when 22
      0.04
    when 22.5
      0.0375
    when 23
      0.035
    when 23.5
      0.0325
    when 24
      0.03
    when 24.5
      0.0275
    when 25
      0.025
    when 25.5
      0.0225
    when 26
      0.02
    when 26.5
      0.0175
    when 27
      0.015
    when 27.5
      0.0125
    when 28
      0.01
    when 28.5..41
      0.005
    when 41.0001..1000
      0.0
    else
      redirect_to :back and return
    end
  end


end
