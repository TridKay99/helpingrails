class AddFirstnameToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :firstname, :string
    add_column :workers, :lastname, :string
  end
end
