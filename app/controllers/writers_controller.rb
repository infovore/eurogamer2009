class WritersController < ApplicationController
  def index
    @writers = Writer.all
  end
  
  def show
    @writer = Writer.find(:first, :conditions => {:slug => params[:id]})
  end
end
