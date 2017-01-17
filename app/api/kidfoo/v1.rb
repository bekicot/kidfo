require 'doorkeeper/grape/helpers'
class Kidfoo::V1 < Api
  format :json
  helpers Doorkeeper::Grape::Helpers

  before do
    doorkeeper_authorize! unless public_endpoint?
  end

  helpers do
    def current_user
      ::User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end

    def public_endpoint?
      public_endpoint.include? "#{request.request_method} #{request.path}"
    end

    def public_endpoint
      [
        'POST /api/v1/user/sign_in',
        'POST /api/v1/user'
      ]
    end
  end

  mount Kidfoo::V1::User => 'user'
end