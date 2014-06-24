class Employee < User
	has_many :projects
	
	has_many :assignments
  	has_many :tasks, through: :assignments

end