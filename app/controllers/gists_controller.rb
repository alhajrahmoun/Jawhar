class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_gist, only: [:show, :edit, :update]
  before_action :find_gists, only: [:index]
  before_action :explore_gists, only: [:explore]
  def index
    if @gists.empty?
      redirect_to new_gist_path
    end
  end

  def explore
  end

  def search
    @gists = []
    PgSearch.multisearch(params[:query]).find_each do |doc|
       @gists << doc.searchable
    end
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
    if @gist.user == current_user
      find_gists
    else
      explore_gists
    end
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

  def explore_gists
    @gists = Gist.where.not(user_id: current_user.id).includes(:tags, :snippets, comments: :user).order('created_at DESC')
  end
end
