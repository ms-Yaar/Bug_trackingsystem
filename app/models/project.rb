class Project < ApplicationRecord
    belongs_to :user, foreign_key: 'users_id', class_name: 'User'

    has_many :project_assignments, dependent: :destroy
    has_many :users, through: :project_assignments
  
    has_many :bugs, dependent: :destroy
  
    accepts_nested_attributes_for :users, allow_destroy: true
  
end
