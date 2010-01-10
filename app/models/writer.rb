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
  
  def generosity
    deviance * contribution_percentage
  end
  
end
