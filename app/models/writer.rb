class Writer < ActiveRecord::Base
  has_many :reviews
  
  def average_score
    Review.average(:score, :conditions => {:writer_id => self})
  end
end
