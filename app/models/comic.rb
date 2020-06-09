class Comic < ApplicationRecord
    has_many :comic_borads
    #連載ステータス
    enum seriazation_status: {"連載中":0, "連載終了":1, "休載中":2}
end
