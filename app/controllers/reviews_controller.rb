class ReviewsController < ApplicationController
  def index
    @reviews = Review.find(:all, :order => "written_on DESC")
    @score_distribution = Review.count(:all, :group => "score")
  end
  
  def show
    @review = Review.find(:first, :conditions => {:slug => params[:id]})
    @eg_delta = @review.score.to_f - Review.average(:score)
    @writer_delta = @review.score.to_f - @review.writer.average_score
    @metacritic_delta = @review.metacritic_delta
  end
  
  
  def unscored
    @reviews = Review.find(:all, :conditions => {:score => nil})
  end
  
  def update
    @review = Review.find(:first, :conditions => {:slug => params["id"]})
    @review.score = params[:review][:score]
    @review.save
    redirect_to unscored_reviews_path
  end
end
