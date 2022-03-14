# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Group, user: user
    can :manage, Expenses, user: user

    can %i[read create], Group
    can %i[read create], Expenses
  end
end
