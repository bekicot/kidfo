class Favorite < ActiveRecord::Base
  belongs_to :kid

  CATEGORIES = {

    'Activity' => 'activity',
    'Book' => 'book',
    'Movie' => 'movie'

  }.freeze
end
