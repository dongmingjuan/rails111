class Movie < ApplicationRecord
  validates :tile, presence: true
end
