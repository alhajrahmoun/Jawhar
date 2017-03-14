class GistsController < ApplicationController
  before_filter :find_gist, only: [:show, :edit]
  def index
    @gist = Gist.all.order('created_at DESC')
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
  end

  def edit
  end

  def delete
  end

  private
  def gist_params
    params.require(:gist).permit(:title, :description, snippets_attributes: Snippet.attribute_names.map(&:to_sym) )
  end

  def find_gist
    @gist = Gist.find(params[:id])
  end
end
