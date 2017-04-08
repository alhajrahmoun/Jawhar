class PagesController < ApplicationController
  def index
    redirect_to gists_path if user_signed_in?
  end

  def change_rejected
  	render :file => 'public/422.html'
  end

  def not_found
  	render :file => 'public/404.html'
  end

  def internal_error
  	render :file => 'public/500.html'
  end
end
