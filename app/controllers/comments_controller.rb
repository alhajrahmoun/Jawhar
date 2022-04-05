class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
  	@comment.user_id = current_user.id
  	if @comment.save
      create_notification(@comment, @comment.gist_id)
  	  respond_to do |format|
        format.js
      end
    end
  end

  private
  def comment_params
  	params.require(:comment).permit(:content, :gist_id)
  end

  def create_notification(comment, gist)
    return if current_user.id == Gist.find(gist).user_id
    Notification.create(user_id: Gist.find(gist).user_id,
                        commenter_id: comment.user_id,
                        comment_id: comment.id,
                        gist_id: gist,
                        read: false)
  end
end
