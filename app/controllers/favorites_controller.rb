class FavoritesController < ApplicationController

    def create
        #Transaction
        ActiveRecord::Base.transaction do
            favorite = current_user.favorites.create!(comment_id: params[:id])
            #通知作成
            notification = Notification.new
            notification.create_notification_like!(current_user, favorite)
            #ポイント上限
            PointsHelper.increase_point(favorite.comment.user, params[:point])
            PointsHelper.decrease_point(current_user, params[:point])

            # puts "======in・decremeent======"
            # PointsHelper.increment_point(favorite.comment.user, params[:point])
            # PointsHelper.decrement_point(current_user, params[:point])
            # puts "======in・decremeent======"
            redirect_to comic_board_path(favorite.comment.comic_board_id)
        end
        rescue => e
            puts e
    end

    def destroy
        favorite = current_user.favorites.find_by(comment_id: params[:id])
        favorite.destroy
        redirect_to comic_board_path(favorite.comment.comic_board_id)
    end
end
