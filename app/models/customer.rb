class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :cartitems
  has_many :orders
    def is_deleted?
     self.deleted_at.present?
    end
    
    def full_name
       first_name + last_name
    end
end
