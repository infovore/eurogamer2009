class Writer < ActiveRecord::Base
  has_many :reviews
  
  def to_param
    slug
  end
  
  def average_score
    Review.average(:score, :conditions => {:writer_id => self})
  end
  
  def min_score
    Review.minimum(:score, :conditions => {:writer_id => self})
  end
  
  def max_score
    Review.maximum(:score, :conditions => {:writer_id => self})
  end
  
  def total_score
    Review.sum(:score, :conditions => {:writer_id => self})
  end
  
  def contribution
    reviews.count.to_f / Review.count(:all)
  end
  
  def contribution_percentage
    contribution * 100
  end
  
  def deviance
    average_score - Review.average(:score)
  end
  
  def influence
    deviance * contribution_percentage
  end
  
  def score_distribution
    reviews.count(:all, :group => "score")
  end
  
  def reviews_by_week
    reviews.group_by(&:week).sort
  end
  
  def year_of_reviews
    # weeks = (1..52).to_a.map {|w| [w, []]}
    year = Hash.new
    (1..52).each {|w| year[w] = []}
    
    reviews_by_week.each do |week, reviews|
      week = week.to_f.to_i
      year[week] = reviews
    end
    year.sort
  end
end
