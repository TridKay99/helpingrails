class AddUsernameToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :username, :string
    add_index :workers, :username, unique: true
  end
end
