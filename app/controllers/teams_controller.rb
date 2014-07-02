class TeamsController < ApplicationController

def index
  @teams = Team.all
end

def about
end


end
