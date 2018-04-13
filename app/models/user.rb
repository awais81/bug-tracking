class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   
has_many :developerbugs,class_name: "Bug" ,foreign_key: "developer_id"
has_many :creatorbugs ,class_name: "Bug",foreign_key: "creator_id"
has_many :project_users ,dependent: :destroy
has_many :projects, through: :project_users
   
has_many :managerprojects, class_name: "Project" ,foreign_key: "manager_id"
devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable
validates :name, presence: true
	validates :user_type, presence: true

def self.returnUserDevelopers
	users=User.where(user_type: 'Developer').all
	users1=User.where(user_type: 'QA').all
	users=users+users1
	users.each do |user|
		s=user.name
		s2=user.user_type
		s=s+" ("+s2+")"
		user.name=s
	end
end
def self.returnUserDevelopersQA
	users=User.where(user_type: 'Developer').all
	users1=User.where(user_type: 'QA').all
	users=users+users1
	
end
def userRole
	user.user_type
	
end

end
