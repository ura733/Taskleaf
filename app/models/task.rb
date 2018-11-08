class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, lenght: { maximum: 30}
end
