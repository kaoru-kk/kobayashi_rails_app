class CommentsController < ApplicationController
    def create 
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.board_id = params[:comic_board_id]
        if @comment.save
            redirect_to comic_board_path(@comment.board_id)
        else
            @reply = Comment.new
            @comic_board = ComicBoard.find(@comment.board_id)           
            @comments = Comment.where(parent_id: nil, board_id: @comment.board_id)
            render template: "comic_boards/show"
        end
    end

    def reply
        @reply = Comment.new(comment_params)
        @reply.user_id = current_user.id
        @reply.board_id = params[:comic_board_id]
        @reply.parent_id = params[:id]
        if @reply.save
            redirect_to comic_board_path(@reply.board_id)
        else
            @comment = Comment.new
            @comic_board = ComicBoard.find(@reply.board_id)           
            @comments = Comment.where(parent_id: nil, board_id: @reply.board_id)
            render template: "comic_boards/show"
        end
    end

    private
    
    def comment_params
        params.require(:comment).permit(:comment_text)
    end


end
