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
    @gists = Gist.search_by_title(params[:query])
    redirect_to root_path if @gists.nil?
  end

  def new
    @gist = Gist.new
    @gist.snippets.build
  end

  def create
    @gist = current_user.gists.new(gist_params)
    if @gist.save
      redirect_to @gist
    else
      render 'new'
    end
  end

  def show
    redirect_to '/404.html' if @gist.nil?

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
    params.require(:gist).permit(:title, :description, tag_list: [], snippets_attributes: Snippet.attribute_names.map(&:to_sym) )
  end

  def find_gist
    scope = Gist.includes(:tags, :snippets, comments: :user)
    @gist = if params[:id]
              scope.find_by(id: params[:id])
            elsif params[:slug]
              scope.find_by(slug: params[:slug])
            end
  end

  def find_gists
    @gists = Gist.includes(:tags, :snippets, comments: :user).where('user_id = ?', current_user.id).order('created_at DESC')
  end

  def explore_gists
    @gists = Gist.where.not(user_id: current_user.id).includes(:tags, :snippets, comments: :user).order('created_at DESC')
  end
end
