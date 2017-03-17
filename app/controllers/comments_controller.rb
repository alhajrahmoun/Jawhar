class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
  	@comment = Comment.new(comment_params)
  	@comment.user_id = current_user.id
  	@comment.save
  	respond_to do |format|
      format.js
    end
  end

  private
  def comment_params
  	params.require(:comment).permit(:content, :gist_id)
  end
end
