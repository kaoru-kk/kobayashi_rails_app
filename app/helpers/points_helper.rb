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
end
