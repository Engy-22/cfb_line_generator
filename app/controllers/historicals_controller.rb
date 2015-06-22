class HistoricalsController < ApplicationController

  def push
    render
  end

  def spread_to_ml
    @historicals = Historical.all
  end

end
