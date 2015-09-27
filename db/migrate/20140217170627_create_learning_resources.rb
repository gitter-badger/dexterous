class CreateLearningResources < ActiveRecord::Migration
  def change

    create_table :learning_resources do |t|
      t.string :url
      t.string :title, null: false
      t.string :slug, null: false
      t.integer :milestone_id
      t.integer :track_id, null: false
      t.text :description
      t.text :metadata
      t.timestamps
    end

    add_index :learning_resources, :slug, unique: true
    add_index :learning_resources, [:milestone_id, :slug]
    add_index :learning_resources, [:track_id, :slug]

  end
end
