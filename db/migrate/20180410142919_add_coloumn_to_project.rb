class AddColoumnToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :manger_id, :integer
  end
end
