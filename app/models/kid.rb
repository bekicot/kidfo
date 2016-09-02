class Kid < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	
	belongs_to :user
	has_many :books
	has_many :movies
	has_many :foods
	has_many :drinks
	has_many :favorites
	
	GENDER = {

		'Male' => 'M', 
		'Female' => 'F',

	}

	validates :name, :presence => true

end
