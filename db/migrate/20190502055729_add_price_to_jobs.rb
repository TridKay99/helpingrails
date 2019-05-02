class AddPriceToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :price, :integer
  end
end
