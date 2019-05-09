class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :jobs, :dependent => :delete_all
  has_many :customer_reviews, :dependent => :delete_all
  validates :username, uniqueness: true
  has_one_attached :avatar
  def resize_avatar
    return self.avatar.variant(resize: "75x75!")
  end
end
