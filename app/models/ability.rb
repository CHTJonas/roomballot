class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    if user.present?
      if user.admin?
        can :manage, :all # Administrators can do anything!
      else
        can [:read, :update], User, id: user.id # Users have edit control of their own user account.
      end
    end
  end
end
