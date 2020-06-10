class FavoritesController < ApplicationController
    def create
        favorite = current_user.favorites.create(comment_id: params[:comment_id])
        redirect_to comic_board_path(params[:id])
    end

    def destroy
        favorite = current_user.favorites.find_by(comment_id: params[:comment_id])
        favorite.destroy
        redirect_to comic_board_path(params[:id])
    end
end
