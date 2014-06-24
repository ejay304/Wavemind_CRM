class Company < ActiveRecord::Base
	mount_uploader :avatar, CompanyAvatarUploader
	has_many :activities
	has_many :contacts
end
