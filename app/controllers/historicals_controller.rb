class HistoricalsController < ApplicationController

  def push

  end

  def spread_to_ml
    @historicals = Historical.all
  end

end
