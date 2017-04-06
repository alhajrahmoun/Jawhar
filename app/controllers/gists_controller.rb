class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_gist, only: [:show, :edit, :update]
  before_action :find_gists, only: [:show, :index]
  def index
    if @gists.empty?
      refirect_to new_gist_path
    end
  end

  def explore
    @gists = Gist.all.includes(:tags, :snippets, comments: :user).order('created_at DESC')
  end

  def new
    @gist = Gist.new
    @gist.snippets.build
  end

  def create
    @gist = Gist.new(gist_params)
    @gist.user_id = current_user.id
    if @gist.save
      redirect_to @gist
    else
      render 'new'
    end
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    authorize @gist
  end

  def update
    authorize @gist
    if @gist.update(gist_params)
      redirect_to @gist
    else
      render 'new'
    end
  end

  def delete
  end

  private
  def gist_params
    params.require(:gist).permit(:title, :description, :tag_list, snippets_attributes: Snippet.attribute_names.map(&:to_sym) )
  end

  def find_gist
    @gist = Gist.includes(:tags, :snippets, comments: :user).find(params[:id])
  end

  def find_gists
    @gists = Gist.includes(:tags, :snippets, comments: :user).where('user_id = ?', current_user.id).order('created_at DESC')
  end
end
