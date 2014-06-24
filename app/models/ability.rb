class Ability
  include CanCan::Ability

  def initialize(user)

        user ||= User.new # guest user

        if user.role? :employee
            can :manage, :all

        elsif user.role? :trainee
            can :read, :all
        end
    end
end
