class TeamsController < ApplicationController

def index
  @teams = Team.all
  @profile =
end

def about
end


end
