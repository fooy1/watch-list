class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true
  validates_uniqueness_of :title
  validates :overview, presence: true
end
