class User < ActiveRecord::Base
	mount_uploader :teamroom_file, TeamroomFileUploader
end
