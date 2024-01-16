class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :developer
end
