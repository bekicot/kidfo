class Movie < ActiveRecord::Base
  Tmdb::Api.key("omdb_api_key")
  belongs_to :favorite
end
