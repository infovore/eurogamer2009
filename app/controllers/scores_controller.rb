class ScoresController < ApplicationController
  def show
    @score = params[:id]
    @reviews = Review.all(:conditions => {:score => @score})
  end
end
