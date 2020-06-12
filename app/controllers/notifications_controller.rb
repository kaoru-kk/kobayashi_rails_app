class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications.where.not(visitor_id: current_user.id)
    @notifications.where(checked: false).update_all(checked: true)
  end
end
