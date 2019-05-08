class AddAcceptToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :accepted, :boolean, default:false
  end
end
