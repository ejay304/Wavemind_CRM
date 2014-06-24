class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :token_authenticatable, :confirmable,
	# :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	def full_name
		self.firstname + " " + self.name
	end

	def role?

		case self.type
		when "Contact"
			:contact
		when "Employee"
			if	self.firstname == "Kevin"
				:trainee
			else
				:employee
			end
		end
	end

	def self.types 
		["Contact","Employee"]
	end

	def self.typeName(type)
		case type
		when "Employee"
			"employé"
		when "Contact"
			"contact"
		end
	end

	def self.create(type)

		case type
		when "Employee"
			Employee.new
		when "Contact"
			Contact.new
		else
			User.new
		end
		
	end

end
