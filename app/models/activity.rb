class Activity < ActiveRecord::Base
	belongs_to :project
	belongs_to :task_type
	has_many :tasks
end
