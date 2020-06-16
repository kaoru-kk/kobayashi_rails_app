class TopController < ApplicationController
  def top
    @comic_boards = ComicBoard.where(latest_status: 1)
    if user_signed_in?
      NotificationsHelper.create_point_notification(current_user)
    end
  end
end
