class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :title
      t.references :customer, index: true
      t.references :worker, index: true
      t.timestamps
    end
  end
end
