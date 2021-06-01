class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.text :desc
      t.string :location
      t.string :show_type
      t.datetime :show_dt_time
      t.timestamps
    end
  end
end
