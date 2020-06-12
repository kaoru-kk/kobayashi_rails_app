class ComicBoard < ApplicationRecord
    belongs_to :comic
    has_many :comments, dependent: :destroy
    has_many :notifications, dependent: :destroy
end
