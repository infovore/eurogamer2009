class WritersController < ApplicationController
  def index
    @writers = Writer.all.sort_by{|r| r.reviews.count}.reverse
  end
  
  def show
    @writer = Writer.find(:first, :conditions => {:slug => params[:id]})
  end
end
