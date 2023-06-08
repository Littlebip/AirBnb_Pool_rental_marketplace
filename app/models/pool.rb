class Pool < ApplicationRecord
  belongs_to :user

  has_many_attached :images

  validates :address, :price, presence: true
  validates :size, inclusion: { in: ['small', 'medium', 'large'] }
end
