class Company < ActiveRecord::Base
	mount_uploader :avatar, CompanyAvatarUploader
end
