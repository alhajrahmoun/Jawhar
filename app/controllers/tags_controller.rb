class TagsController < ApplicationController
  def show
  	@tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @gists = Gist.tagged_with(@tag.name).public_gists
  end
end
