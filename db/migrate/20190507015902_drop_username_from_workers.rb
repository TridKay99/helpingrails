class DropUsernameFromWorkers < ActiveRecord::Migration[5.2]
  def change
    remove_column :workers, :username
  end
end
