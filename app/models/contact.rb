class Contact < User
	has_many :projects
	belongs_to :contact

end