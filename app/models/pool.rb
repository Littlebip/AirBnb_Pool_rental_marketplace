class Pool < ApplicationRecord
  belongs_to :user

  has_many_attached :images

  validates :address, :price, presence: true
  validates :size, inclusion: { in: ['small', 'medium', 'large'] }

  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?
end
