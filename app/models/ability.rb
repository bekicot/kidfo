class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Family
    can [:create], Family if user.parentuser?
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
      invite.team == user.family
    end
    can :create, Invite if user.parentuser?

  end
end
