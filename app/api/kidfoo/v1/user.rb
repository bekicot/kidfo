class Kidfoo::V1::User < Grape::API

  rescue_from ActiveRecord::RecordNotFound do |e|
    error!({ message: "User can\'t be found!" }, 400)
  end

  helpers do
    def success(data)
      { status: :success, data: data }
    end
    def error(data, status = 400)
      error!({ status: 'fail', data: data }, status)
    end
  end

  get do
    success(current_user)
  end

  get 'families' do
    success(current_user.families)
  end

  get 'kids' do
    success(current_user.kids)
  end

  params do
    requires :family_id
    group :kids, type: Hash do
      requires :name
      optional :birthdate, :gender, :bedtime, :sleeproutine, :allergies,
               :nonos, :family_id, :created_at, :updated_at, :avatar, :nap1,
               :nap2, :nap3, :naproutine, :breakfasttime, :breakfastdetails,
               :snack1time, :snack1details, :lunchtime, :lunchdetails,
               :snack2time, :snack2details, :dinnertime, :dinnerdetails,
               :afterdinnertime, :afterdinnerdetails
    end
  end
  post 'kids' do
    return error({ family: 'Family cant be found or is not associated with you!'}) unless family = current_user.families.find_by(id: params[:family_id])
    kid = Kid.create!(declared(params, include_missing: false)[:kids])
    family.kids << kid
    success(kid)
  end

  params do
    requires :email, :password, :application_id
  end

  post 'sign_in' do
    user = User.find_by(email: params[:email])
    error('invalid email!') unless user
    application = Doorkeeper::Application.find_by(uid: params[:application_id])
    if user.valid_password?(params[:password])
      response = { status: 'success' }
      token = Doorkeeper::AccessToken.create(application: application, resource_owner_id: user.id).token
      response.merge!( data: user.serializable_hash.merge(access_token: token) )
      return response
    else
      error!({ status: 'fail', data: { password: 'Password is invalid!' } }, 400)
    end
  end

end