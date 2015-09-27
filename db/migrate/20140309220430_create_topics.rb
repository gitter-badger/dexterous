class CreateTopics < ActiveRecord::Migration
  def change

    create_table :topics do |t|
      t.integer :subject_id, null: false
      t.integer :subject_type, null: false
      t.string :title, null: false
      t.string :slug, null: false
      t.timestamps
    end

    add_index :topics, :slug, unique: true
    add_index :topics, [:subject_id, :subject_type, :slug]

  end
end
