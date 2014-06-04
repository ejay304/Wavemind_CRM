class Task < ActiveRecord::Base
  belongs_to :task_type
  belongs_to :activity
end
