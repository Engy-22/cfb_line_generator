class ProfilesController < ApplicationController

def pr
  @profiles = Profile.all.order('power_ranking desc')
end

def hfa
  @profiles = Profile.all.order('hfa DESC, power_ranking DESC')
end

def edit
  @team = Team.find(params[:team_id])
  @profile = Profile.find(params[:id])
  @counter = 0
end

def update
  @profile = Profile.find(params[:id])
    if @profile.update_attributes!(profile_params)
      respond_to do |format|
        format.html {redirect_to pr_path}
        format.json {render :json => @profile}
      end
    else
      render action: :edit
    end
end

def show
  @profile = Profile.find(params[:id])
end



private
  def profile_params
    params.require(:profile).permit(:power_ranking, :hfa, :offense, :defense, :notes)
  end
end
