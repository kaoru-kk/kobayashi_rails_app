class Point < ApplicationRecord
    #付与したポイント
    has_many :give_points, class_name: "PointReciever", foreign_key: "point_id", dependent: :destroy

    validations =  %i[title point start_date end_date]
    validations.each do |v|
        validates v , presence: true
    end

    ACTION_VALUES = ["ログインボーナス", "シーズンイベント", "その他"]
    validates :point_category,  presence: true, inclusion: {in:ACTION_VALUES}

end
