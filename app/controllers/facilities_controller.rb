class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
  end

  def show
    @facilities = Facility.first
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
