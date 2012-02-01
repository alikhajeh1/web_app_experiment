class AddMovieColumnsToVideos < ActiveRecord::Migration
  def self.up
    change_table :videos do |t|
      t.has_attached_file :movie
    end
  end

  def self.down
    drop_attached_file :videos, :movie
  end
end