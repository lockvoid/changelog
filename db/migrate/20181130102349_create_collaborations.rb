class CreateCollaborations < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborations do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :collaborations, [:project_id, :user_id]
  end
end
