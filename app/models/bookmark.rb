class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, lenght: { minimum: 6 }
  validates :movie_id, presence: { scope: :list_id }
end
