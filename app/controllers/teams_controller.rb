class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def about
    render
  end


end
