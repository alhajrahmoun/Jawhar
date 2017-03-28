class PagesController < ApplicationController
  def index
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
