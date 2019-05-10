class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :jobs, :dependent => :delete_all
         has_many :worker_reviews, :dependent => :delete_all
  validates :username, uniqueness: true
  has_one_attached :avatar

  def self.generate_random_images 
    array_of_image_urls = ['https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/0.jpg', 'https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/1.jpg', 'https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/10.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/11.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/12.jpg', 'https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/13.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/14.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/15.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/16.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/17.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/18.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/19.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/20.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/21.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/22.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/2.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/3.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/4.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/5.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/3.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/6.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/7.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/8.jpg','https://s3-ap-southeast-2.amazonaws.com/helping-hand-project/9.jpg',]
    return array_of_image_urls.sample
  end 
end
