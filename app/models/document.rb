class Document < ActiveRecord::Base
  belongs_to :document_type
  belongs_to :activity
  mount_uploader :link, DocumentUploader
	

  def extention filename
  	File.extname filename
  end

  def logo
    extention = extention self.link.url
    extention.slice!(0)
  	 filename = "documents/#{extention}.gif"
  end
end
