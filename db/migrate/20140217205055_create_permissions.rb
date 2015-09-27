class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :contributorships do |t|

      t.integer :user_id, null: false
      t.integer :track_id, null: false

      t.boolean :can_view, null: false, default: false
      t.boolean :can_edit, null: false, default: false
      t.boolean :can_manage, null: false, default: false

      t.timestamps
    end

    add_index :contributorships, [:user_id, :track_id]

  end
end
