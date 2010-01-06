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
end
