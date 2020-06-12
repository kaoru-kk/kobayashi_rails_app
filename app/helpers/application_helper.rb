module ApplicationHelper
    def notification_check?
        notification = current_user.passive_notifications.where(checked: false)
        notification.exists? ? true : false 
    end
end
