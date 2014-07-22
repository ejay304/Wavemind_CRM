class Document < ActiveRecord::Base
  belongs_to :document_type
  belongs_to :activity

  do_not_validate_attachment_file_type :link

  has_attached_file :link,
    :storage => :dropbox,
	:dropbox_credentials => Rails.root.join("config/dropbox.yml")


end
