class Review < ActiveRecord::Base
  belongs_to :writer
  
  def to_param
    slug
  end
  
  def to_slug
    title.downcase.gsub(/[^a-zA-Z0-9\s]/, "").gsub(/\s/, "-")
  end
  
  def deviance
    score - Review.average(:score)
  end
  
  def writer_deviance
    score - writer.average_score
  end
  
  def week
    written_on.strftime('%W').to_f.to_i
  end
end
