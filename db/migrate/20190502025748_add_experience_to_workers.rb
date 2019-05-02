class AddExperienceToWorkers < ActiveRecord::Migration[5.2]
  def change
    add_column :workers, :experience, :string
  end
end
