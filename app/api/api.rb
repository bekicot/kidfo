class Api < Grape::API
  mount Kidfoo::V1 =>'v1'
end