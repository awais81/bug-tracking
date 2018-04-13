class Bug < ApplicationRecord
  	belongs_to :project
  	belongs_to :developer, class_name: "User",
                          foreign_key: "developer_id",optional: true
   	belongs_to :creator, class_name: "User",
                          foreign_key: "creator_id"

	mount_uploader :screenshot, ScreenshotUploader
	validates :title, presence: true
	validates :status, presence: true
	validates :bug_type, presence: true

end
