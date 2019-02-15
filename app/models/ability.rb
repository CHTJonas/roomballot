class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    if user.present?
      if user.admin?
        can :manage, :all # Administrators can do anything!
      else
        can [:read, :update], User, id: user.id   # Users have edit control of their own user account but nobody else's.
        can [:read, :join], BallotGroup           # Users can view/join any ballot group.
        can :crud, BallotGroup, user_id: user.id  # Owners of a ballot group can do anything with that group.
        can :read, House                          # Users can view but not edit houses.
      end
    end
  end
end
