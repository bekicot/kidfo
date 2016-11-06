class Family < ActiveRecord::Base

	belongs_to :user
	has_many :guardians, :through => :user
	has_many :kids

end
