class HomeController < ApplicationController
  def show
    @score_distribution = Review.count(:all, :group => "score")
  end
  
end
