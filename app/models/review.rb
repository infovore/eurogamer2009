class Review < ActiveRecord::Base
  belongs_to :writer
  
  def to_param
    slug
  end
  
  def to_slug
    title.downcase.gsub(/[^a-zA-Z0-9\s]/, "").gsub(/\s/, "-")
  end
end
