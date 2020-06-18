class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications
  end

  def update
    notification = Notification.find(params[:id])
    notification.update(checked: true)

    if notification.point_id != nil
      point = Point.find(notification.point_id)
      PointsHelper.increase_point(current_user, point.point )
      PointReciever.create!(user_id: current_user.id, point_id: notification.point_id)
    end
    redirect_to notifications_path
  end

  def point_send
    users = User.all
    point = Point.find(params[:point_id])

    ActiveRecord::Base.transaction do
      users.find_each do |user|
        Notification.create!(
          visited_id: user.id,
          point_id: point.id,
          action: "ポイント"
          )
      end
      point.update!(send_status: true)
      flash[:sucess] = "ポイントの送信完了しました！"
      redirect_to point_path(point.id)
    end

    rescue => e
      puts e
  end
end
