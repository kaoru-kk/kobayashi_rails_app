class Point < ApplicationRecord
    #付与したポイント
    has_many :give_points, class_name: "PointReciever", foreign_key: "point_id", dependent: :destroy
end
