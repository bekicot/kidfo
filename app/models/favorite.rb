class Favorite < ActiveRecord::Base
  belongs_to :kid

  CATEGORIES = {

    'Activity' => 'activity',
    'Food' => 'food',
    'Drink' => 'drink'

  }.freeze
end
