class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :comic_board, optional: true
    
    belongs_to :parent,  class_name: "Comment", optional: true
    has_many   :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

    validates :comment_text, presence: true
end
