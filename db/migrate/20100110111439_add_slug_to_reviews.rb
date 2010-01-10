class AddSlugToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :slug, :string
  end

  def self.down
    remove_column :reviews, :slug
  end
end
