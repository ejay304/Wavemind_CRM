class Project < ActiveRecord::Base
  belongs_to :responsible,  class_name: "Employee" 
  has_many :images
  has_many :activites
  belongs_to :contact


  def self.types
  	project_types = I18n.t(:project_types)

    project_types.keys.each_with_object([]) do |type, object|
      object << [I18n.t("project_types.#{type}"), type]		
    end
  end

end
