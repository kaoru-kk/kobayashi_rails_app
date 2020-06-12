class CommentsController < ApplicationController
    def create 
        @comment = current_user.comments.new(comment_params)
        @comment.comic_board_id = params[:comic_board_id]
        if @comment.save
            redirect_to comic_board_path(@comment.comic_board_id)
        else
            @reply = Comment.new
            @comic_board = ComicBoard.find(@comment.comic_board_id)           
            @comments = Comment.where(parent_id: nil, comic_board_id: @comment.comic_board_id)
            render template: "comic_boards/show"
        end
    end

    def reply
        @reply = current_user.comments.new(comment_params)
        @reply.comic_board_id = params[:comic_board_id]
        @reply.parent_id = params[:id]
        
        #Transaction追加（返信と通知処理挟むため）
        ActiveRecord::Base.transaction do
            @reply.save!
            notification = Notification.new
            notification.save_notification_comment!(current_user, @reply)
            redirect_to comic_board_path(@reply.comic_board_id)
        end

        rescue => e
            puts e
            @comment = Comment.new
            @comic_board = ComicBoard.find(@reply.comic_board_id)           
            @comments = Comment.where(parent_id: nil, comic_board_id: @reply.comic_board_id)
            render template: "comic_boards/show"
    end

    private
    
    def comment_params
        params.require(:comment).permit(:comment_text)
    end


end
