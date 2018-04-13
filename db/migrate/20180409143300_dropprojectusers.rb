class Dropprojectusers < ActiveRecord::Migration[5.1]
  def change
    drop_table :project_users
  end
end
