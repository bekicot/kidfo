class Parent < User
  has_one :parenthood
  has_one :family, through: parenthood
end
