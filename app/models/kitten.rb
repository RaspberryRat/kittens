class Kitten < ApplicationRecord
  validates :name, presence: true, length: { in: 3..15 }
  validates :age, presence: true, numericality: { less_than: 25 }
  validates :cuteness, presence: true, numericality: { in 1..10 }
  validates :softness, presence: true, numericality: { in: 1..10 }
end
