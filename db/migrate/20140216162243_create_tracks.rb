class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|

      t.string :title
      t.text :description
      t.string :visibility

      t.timestamps

    end
  end
end
