class AddMetacriticToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :metacritic_url, :string
    add_column :reviews, :metacritic_score, :integer
  end

  def self.down
    remove_column :reviews, :metacritic_url
    remove_column :reviews, :metacritic_score
  end
end
