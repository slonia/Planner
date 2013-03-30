class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :place
      t.datetime :started_at
      t.datetime :finished_at
      t.string :repeat
      t.integer :user_id

      t.timestamps
    end
  end
end
