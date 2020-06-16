class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.where.not(visitor_id: current_user.id)
  end

  def update
    notification = Notification.find(params[:id])

    #transactionしたほうがいい？検討
    notification.update(checked: true)
    point = Point.find(notification.point_id)
    PointsHelper.increase_point(current_user, point.point )
    PointReciever.create!(user_id: current_user.id, point_id: notification.point_id)

    redirect_to notifications_path
  end
end
