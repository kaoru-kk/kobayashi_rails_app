class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :comic_board, optional: true
end
