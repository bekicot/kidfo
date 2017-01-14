class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User
    can :read, Family
    can [:create], Family
    can [:edit], Family if user.parentuser? || user.parentsitteruser?
    can [:update], Family do |family|
      user.family == family
    end
    
    can :read, Invite do |invite|
      invite.email == user.email
    end
    can [:accept, :reject], Invite do |invite|
      invite.email == user.email
    end
    can :cancel, Invite do |invite|
      invite.family == user.family
    end
    can :create, Invite if user.parentuser? || user.parentsitteruser?
    can :create, Sitrequest
  end
end
