class Updatecolou < ActiveRecord::Migration[5.1]
  def change
  	rename_column :projects, :manger_id, :manager_id
  end
end
