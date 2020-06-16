module NotificationsHelper
    module_function
    def notification_check?(current_user)
        notification = current_user.passive_notifications.where(checked: false) 
        notification.exists? ? true : false 
    end

    def create_point_notification(user)
        latest_login_bonus = Point.where(point_category:"ログインボーナス").last
        
        #最新のログインボーナスを受け取ったかチェック
        login_bonus_check = PointReciever.where(user_id: user.id, point_id: latest_login_bonus.id)
        login_bonus_check.blank? ? (puts "処理続行") : (return false)

        #既に通知していないかチェック
        notification_check = Notification.where(visited_id: user.id, point_id: latest_login_bonus.id)
        notification_check.blank? ? (puts "処理続行") : (return false)

        Notification.create!(visitor_id:1,visited_id: user.id,point_id:latest_login_bonus.id,  action: "ポイント")
    end
end
