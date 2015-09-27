class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|

      t.string :title
      t.string :slug
      t.text :description
      t.string :visibility

      t.timestamps

    end

    add_index :tracks, :slug, unique: true
    add_index :tracks, [:visibility, :slug]

  end
end
