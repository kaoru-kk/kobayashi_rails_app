module PointsHelper
    module_function

    #ポイントをもらった側
    def increase_point(user, point)
        user.lock!
        user.increment!(:point_count, (point).to_i)
    end

    #ポイントをあげた側
    def decrease_point(user, point)
        user.lock!
        user.decrement!(:point_count, (point).to_i)
    end

    def increment_point(user, point)
        user.increment!(:point_count, (point).to_i)
    end

    def decrement_point(user, point)
        user.decrement!(:point_count, (point).to_i)
    end

    def find_point(id)
        point = Point.find(id)
        return "#{point.title}：#{point.point}"
    end

    
    #PointsHelper.thread_test
    #PointsHelper.cry_check_times
    #悲観動作チェック
    # def cry_check
    #     point = 40
    #     user = User.find(3)
    #     user.with_lock do
    #         result = user.point_count + (point).to_i
    #         user.update!(point_count: result)
    #         puts "処理が終わった後のポイントは#{user.point_count}!"
    #         puts Time.now
    #     end
    # end

    # def thread_test
    #     threads = []
    #     ActiveRecord::Base.transaction do
    #         threads << Thread.new{ PointsHelper.cry_check }
    #         threads << Thread.new{ PointsHelper.cry_check }
    #     end
    #     threads.each { |t| t.join }

    #     puts "#{User.find(3).point_count}が最新のポイントです"
    #     puts "done!"
    # end
end
