class AddStatusToProjectInvite < ActiveRecord::Migration[5.1]
  def change
    add_column :project_invites, :status, :string
  end
end
