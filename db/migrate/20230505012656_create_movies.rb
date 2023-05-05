class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string "title"
      t.string "year released"
      t.string "mpaa rating"
      t.integer "studio_id"
      t.timestamps
    end
  end
end
