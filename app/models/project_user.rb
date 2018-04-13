class ProjectUser < ApplicationRecord
  belongs_to :developer ,class_name: "User" ,foreign_key: "user_id"

  belongs_to :project

end
