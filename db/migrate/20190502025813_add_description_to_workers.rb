class AddDescriptionToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :description, :string
  end
end
