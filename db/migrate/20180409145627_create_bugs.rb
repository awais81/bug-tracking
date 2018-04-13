class CreateBugs < ActiveRecord::Migration[5.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.datetime :deadline
      t.string :screenshot
      t.string :type
      t.string :status
      t.references :project, foreign_key: true
      t.integer :developer_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
