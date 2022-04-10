class CommentsController < ApplicationController
  def new
  	@comment = current_user.comments.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
  	if @comment.save
  	  respond_to do |format|
        format.js
      end
    end
  end

  private

  def comment_params
  	params.require(:comment).permit(:content, :gist_id)
  end
end
