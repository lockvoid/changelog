class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :viewer_id
      t.references :notice, foreign_key: true

      t.timestamps
    end

    add_index :events, :name
    add_index :events, :viewer_id
  end
end
