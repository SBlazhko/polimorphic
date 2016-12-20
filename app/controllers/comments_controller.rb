class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :commentable_type, :commentable_id)
  end
end
