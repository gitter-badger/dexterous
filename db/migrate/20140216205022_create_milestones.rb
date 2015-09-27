class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :track_id, null: false
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description
      t.integer :expected_duration
      t.integer :score
      t.timestamps
    end

    add_index :milestones, [:track_id, :slug]
    add_index :milestones, :slug, unique: true

  end
end
