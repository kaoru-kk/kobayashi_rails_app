class FavoritesController < ApplicationController

    def create
        #Transaction
        ActiveRecord::Base.transaction do
            favorite = current_user.favorites.create!(comment_id: params[:id])
            #通知作成
            notification = Notification.new
            notification.create_notification_like!(current_user, favorite)
            #ポイント増減
            PointsHelper.increase_point(favorite.comment.user, params[:point])
            PointsHelper.decrease_point(current_user, params[:point])
            redirect_to comic_board_path(params[:comic_board_id])
        end
        rescue => e
            puts e
            redirect_to comic_board_path(params[:comic_board_id])
    end

    def destroy
        favorite = current_user.favorites.find_by(comment_id: params[:id])
        favorite.destroy
        redirect_to comic_board_path(favorite.comment.comic_board_id)
    end
end
