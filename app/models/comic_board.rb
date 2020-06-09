class ComicBoard < ApplicationRecord
    belongs_to :comic
    #アソシエーションの関係でcomic_board_idを探しに行っていたので、foreign_keyで指定
    has_many :comments, foreign_key: "board_id"

    def hoge 
        "faefasefopsmfpamsfpmasefpmasepfmsaoep"
    end
end
