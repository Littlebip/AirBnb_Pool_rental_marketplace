class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pool

  validates :start_date, :end_date, presence: true
  validates :end_date, comparison: { greater_than: :start_date }
  validates :status, inclusion: { in: ['accepted', 'declined'] }

end
