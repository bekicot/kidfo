class Sit < ActiveRecord::Base
	belongs_to :family
	has_many :sitrequests
end
