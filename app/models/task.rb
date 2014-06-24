class Task < ActiveRecord::Base
  belongs_to :task_type
  belongs_to :activity
  
  has_many :assignments
  has_many :employees, through: :assignments
  accepts_nested_attributes_for :employees

    def self.states
    	task_states = I18n.t(:task_state)

      task_states.keys.each_with_object([]) do |state, object|
        object << [I18n.t("task_state.#{state}"), state]		
    end
  end
end
