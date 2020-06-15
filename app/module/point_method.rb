module PointMethod

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
    
    module_function :increase_point
    module_function :decrease_point
end
