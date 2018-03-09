class ProjectInvite < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :status, inclusion: {in: ["pending", "declined", "accepted"]}

  scope :accepted_users, -> { where(status: 'accepted') }
  scope :pending_users, -> {where(status: 'pending')}
  # Project.find(6).users.merge(ProjectInvite.accepted_users)
  # Project.findI(6).users.merge(ProjectInvite.pending_users)
  # ABOVE WILL RETURN ONLY ACCEPTED USERS OF A PROJECT
end
