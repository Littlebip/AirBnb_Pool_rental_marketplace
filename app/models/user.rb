class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, through: :pools

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true
  # validates_format_of :email, with => /^\S+@\S+\.\S+$/
end
