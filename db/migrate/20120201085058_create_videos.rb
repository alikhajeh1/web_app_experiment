class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.text :description
      t.string :author
      t.string :movie_file_name
      t.string :movie_content_type
      t.integer :movie_file_size
      t.datetime :movie_updated_at
      t.timestamps
    end
  end
end
