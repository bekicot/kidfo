class Sit < ActiveRecord::Base
  belongs_to :sitter, class_name: User
  belongs_to :family
end
