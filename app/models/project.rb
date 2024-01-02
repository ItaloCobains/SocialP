class Project < ApplicationRecord
  after_create_commit { broadcast_prepend_to "projects" }
  after_update_commit { broadcast_replace_to "projects" }
  validates :content, presence: true
end
