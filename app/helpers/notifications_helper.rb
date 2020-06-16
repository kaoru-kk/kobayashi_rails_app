module NotificationsHelper
    module_function
    def notification_check?(current_user)
        notification = current_user.passive_notifications.where(checked: false)
        notification.exists? ? true : false 
    end
end
