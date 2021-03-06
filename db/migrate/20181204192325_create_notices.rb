class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.string :heading
      t.string :body
      t.string :target_element_selector
      t.references :release, foreign_key: true

      t.timestamps
    end
  end
end
