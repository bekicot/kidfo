class Kidfoo::V1::User < Grape::API

  get do
    current_user
  end

  params do
    requires :email, :password
  end
  get 'sign_in' do
    User.find(params[:email])
  end

end