class User < ApplicationRecord
    has_many :project_assignments, dependent: :destroy
  has_many :projects, through: :project_assignments

  has_many :bug_users, dependent: :destroy
  has_many :bugs, through: :bug_users

  enum usertype: { manager: 'manager', developer: 'developer', qa: 'qa' }

  def manager?
    usertype == 'manager'
  end

  def developer?
    usertype == 'developer'
  end

  def qa?
    usertype == 'qa'
  end
end
