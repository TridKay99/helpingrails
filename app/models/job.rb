class Job < ApplicationRecord
  belongs_to :customer
  belongs_to :worker, optional: true
  has_one_attached :uploaded_image
  

end
