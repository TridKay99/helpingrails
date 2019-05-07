class AddUsernameAgainToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :username, :string
  end
end
