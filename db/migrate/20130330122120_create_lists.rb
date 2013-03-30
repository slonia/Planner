class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :color
      t.integer :group_id

      t.timestamps
    end
  end
end
