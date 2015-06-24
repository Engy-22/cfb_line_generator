class TeamsController < ApplicationController

  def index
    @teams = Team.all.order("name")
  end

  def about
    render
  end


end
