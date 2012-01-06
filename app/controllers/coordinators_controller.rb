class CoordinatorsController < ApplicationController
  def index
    @coordinators = Coordinator.all
  end
end
