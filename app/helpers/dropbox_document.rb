module DropboxDocument

  def get_image(document)

	ext =  	File.extname document.path
    ext.slice!(0)
  	
  	"documents/#{ext}.gif"
  end
end