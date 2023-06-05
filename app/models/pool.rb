class Pool < ApplicationRecord
  belongs_to :user

  validates :address, :price, presence: true
  validates :size, inclusion: { in: ['small', 'medium', 'large'] }
end
