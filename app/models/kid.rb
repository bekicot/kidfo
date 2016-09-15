class Kid < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	
	belongs_to :user
	has_many :relationships
	#has_many :users, :through => :relationships
	has_many :favorites
	
	GENDER = {

		'Male' => 'M', 
		'Female' => 'F',

	}

	validates :name, :presence => true

end
