module PointsHelper
    module_function

    #ポイントをもらった側
    def increase_point(user, point)
        result = user.point_count + (point).to_i
        user.update!(point_count: result)
    end

    #ポイントをあげた側
    def decrease_point(user, point)
        result = user.point_count - (point).to_i
        user.update!(point_count: result)
    end

    def login_bonus_check(user)
        latest_login_bonus = Point.where(point_category:"ログインボーナス").last
        #最新のログインボーナスを受け取ったかチェック
        login_bonus_check = PointReciever.where(user_id: user.id, point_id: latest_login_bonus.id)

        if login_bonus_check.blank?
            PointsHelper.increase_point(user, latest_login_bonus.point )
            PointReciever.create(user_id: user.id, point_id: latest_login_bonus.id)
        end
    end
end
