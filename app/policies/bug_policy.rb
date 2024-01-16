

class BugPolicy < ApplicationPolicy
  def show?
    user_assigned_to_bug?
  end

  def create?
    user.manager? || user.developer?
  end

  def update?
    user_assigned_to_bug?
  end

  def destroy?
    user_assigned_to_bug?
  end

  private

  def user_assigned_to_bug?
    record.users.include?(user)
  end
end

