class BookmarksController < ApplicationController
  before_action :find_bookmark, only: :destroy
  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    @bookmark = current_user.bookmarks.build(gist_id: params[:gist_id])
    @bookmark.save
    redirect_to gist_path(params[:gist_id])
  end

  def destroy
    redirect_to bookmarks_path if @bookmark.destroy
  end

  private

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
