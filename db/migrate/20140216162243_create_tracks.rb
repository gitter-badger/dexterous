class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|

      t.string :title, null: false
      t.string :slug, null: false
      t.text :description
      t.integer :visibility_cd, default: 0, null: false

      t.timestamps

    end

    add_index :tracks, :slug, unique: true
    add_index :tracks, [:visibility_cd, :slug]

  end
end
