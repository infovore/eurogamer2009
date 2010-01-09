class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end
  
  def unscored
    @reviews = Review.find(:all, :conditions => {:score => nil})
  end
  
  def update
    @review = Review.find(params[:id])
    @review.score = params[:review][:score]
    @review.save
    redirect_to unscored_reviews_path
  end
end
