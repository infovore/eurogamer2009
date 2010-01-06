class ScoresController < ApplicationController
  
  def index
    @counts = []
    (1..10).each do |i|
      @counts << Review.count(:all, :conditions => {:score => i})
    end
  end
  
  def show
    @score = params[:id]
    @reviews = Review.all(:conditions => {:score => @score})
  end
end
