class TagsController < ApplicationController
  def show
  	@tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @gists = Gist.tagged_with(@tag.name)
  end
end
