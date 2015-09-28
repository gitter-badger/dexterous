class CreateAchievements < ActiveRecord::Migration
  def change

    create_table :achievements do |t|
      t.integer :user_id, null: false
      t.integer :milestone_id, null: false
      t.integer :duration
      t.integer :score
      t.timestamps
    end

    add_index :achievements, :milestone_id
    add_index :achievements, :user_id

  end
end
