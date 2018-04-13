class Project < ApplicationRecord

	has_many :project_users, dependent: :destroy
	has_many :bugs,dependent: :destroy
	has_many :developers , through: :project_users
	belongs_to :manager,  class_name: "User",foreign_key: "manager_id"
	validates :title, presence: true
	validates :description, presence: true
	def getOnlyDevelopers
		developers.where(user_type: 'Developer').all
	end
end

