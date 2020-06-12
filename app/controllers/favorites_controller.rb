class FavoritesController < ApplicationController
    def create
        #Transaction
        ActiveRecord::Base.transaction do
            favorite = current_user.favorites.create!(comment_id: params[:comment_id])
            notification = Notification.new
            notification.create_notification_like!(current_user, favorite)
            redirect_to comic_board_path(params[:id])
        end
        rescue => e
            puts e
    end

    def destroy
        favorite = current_user.favorites.find_by(comment_id: params[:comment_id])
        favorite.destroy
        redirect_to comic_board_path(params[:id])
    end
end
