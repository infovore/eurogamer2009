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
  
  def self.reviews_by_week
    find(:all).group_by(&:week).sort
  end
  
  def self.year_of_reviews
    # weeks = (1..52).to_a.map {|w| [w, []]}
    year = Hash.new
    (1..52).each {|w| year[w] = []}
    
    self.reviews_by_week.each do |week, reviews|
      week = week.to_f.to_i
      year[week] = reviews
    end
    year.sort
  end
end
