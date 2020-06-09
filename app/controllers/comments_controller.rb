class CommentsController < ApplicationController
    def create 
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        @comment.board_id = params[:comic_board_id]
        if @comment.save
            redirect_to comic_board_path(@comment.board_id)
        else
            flash[:error] = "コメントの保存に失敗しました"
            #render 
        end
    end

    private
    
    def comment_params
        params.require(:comment).permit(:comment_text)
    end
end
