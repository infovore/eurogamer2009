class NormalizeWriters < ActiveRecord::Migration
  def self.up
    add_column :reviews, :writer_id, :integer
    remove_column :reviews, :writer
  end

  def self.down
    add_column :reviews, :writer, :string
    remove_column :reviews, :writer_id
  end
end
