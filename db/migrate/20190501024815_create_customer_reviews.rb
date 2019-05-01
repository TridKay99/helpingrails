class CreateCustomerReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_reviews do |t|
      t.string :content
      t.string :description
      
      t.references :customer, index: true
      t.references :worker, index: true

      t.timestamps
    end
  end
end
