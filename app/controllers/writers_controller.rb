class WritersController < ApplicationController
  def index
    @writers = Writer.all
  end
  
  def show
    @writer = Writer.find(params[:id])
  end
end
