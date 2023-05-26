class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  #validates :overview, presence: true
  # validates :poster_url, presence: true, uniqueness: true
  # validates :rating, presence: true, uniqueness: true
  has_many :lists, through: :bookmarks

end
