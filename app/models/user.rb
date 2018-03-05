class User < ApplicationRecord
  has_many :projects
  has_many :project_invites
  has_many :technologies, through: :tech_users
  has_many :my_projects, foreign_key: "user_id", class_name: "Project"

  #User.first.my_projects = there project they created
  #User.first.projects =  project they are working for

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :full_name, presence: true
  validates :git_hub, presence: true, uniqueness: true
end