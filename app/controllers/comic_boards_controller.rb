class ComicBoardsController < ApplicationController

    def show
        @comic_board = ComicBoard.find(params[:id])
        @comments = Comment.where(parent_id: nil, comic_board_id: params[:id])
        @comment = Comment.new
        @reply = Comment.new
    end


    def create
        ActiveRecord::Base.transaction do
            #現在、最新のスレッドを取得→ステータスをNOT最新に変更
            exist_boards = ComicBoard.where(latest_status: 1)
            if exist_boards.exists?
                exist_boards.update_all(latest_status: 0)
            end

            #現在連載中の漫画を取得→最新のスレッド作成
            comics = Comic.where(seriazation_status: "連載中")
            comics_array = []
            comics.each do |comic|
                comics_array << ComicBoard.new(comic_id: comic.id)
            end
            ComicBoard.import comics_array
        end
        redirect_to root_path
    end
end
