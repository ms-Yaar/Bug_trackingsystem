class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  belongs_to :developer, foreign_key: 'developer_id', class_name: 'User', optional: true

  has_many :bug_users
  has_many :users, through: :bug_users

  mount_uploader :screenshot, ScreenshotUploader

  validates :title, uniqueness: { scope: :project_id }
  validates :title, :status, :bugtype, presence: true

  enum status: { new: 'new', started: 'started', completed: 'completed' }, _prefix: :status
  enum bugtype: { feature: 'feature', bug: 'bug' }, _prefix: :bugtype
end
