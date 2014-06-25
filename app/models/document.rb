class Document < ActiveRecord::Base
  belongs_to :document_type
  belongs_to :activity

  has_attached_file :link,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
end
