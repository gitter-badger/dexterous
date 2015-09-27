class CreateEnrollments < ActiveRecord::Migration
  def change

    create_table :enrollments do |t|
      t.integer :user_id, null: false
      t.integer :track_id, null: false
      t.datetime :completed_at
    end

    add_index :enrollments, [:user_id, :track_id]
    add_index :enrollments, [:track_id]

  end
end
