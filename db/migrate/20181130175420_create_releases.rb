class CreateReleases < ActiveRecord::Migration[5.2]
  def change
    create_table :releases do |t|
      t.string :name
      t.string :body
      t.string :version
      t.datetime :date
      t.boolean :published
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
