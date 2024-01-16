

class ProjectPolicy < ApplicationPolicy
  def show?
    user.projects.include?(record)
  end

  def create?
    user.manager?
  end

  def update?
    user.manager? || user_created_project?
  end

  def destroy?
    user.manager? || user_created_project?
  end

  private

  def user_created_project?
    record.user == user
  end
end
