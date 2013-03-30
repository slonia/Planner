class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :state
      t.string :priority
      t.integer :list_id

      t.timestamps
    end
  end
end
