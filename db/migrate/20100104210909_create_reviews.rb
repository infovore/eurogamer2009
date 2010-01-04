class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :title
      t.string :abstract
      t.string :writer
      t.string :url
      t.string :platform
      t.date :written_on
      t.integer :score
      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
