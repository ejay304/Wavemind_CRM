class Project < ActiveRecord::Base
  enum type: [ :developpement, :communication, :network ]

  belongs_to :responsible
end
