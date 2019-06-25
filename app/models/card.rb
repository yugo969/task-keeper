class Card < ApplicationRecord
  belongs_to :list
  validates :title, length: { in: 1..50 }
  validates :memo, length: { maximum: 255 }
end
