class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :jobs, :dependent => :delete_all
         has_many :worker_reviews, :dependent => :delete_all
  validates :username, uniqueness: true
  has_one_attached :avatar
end
