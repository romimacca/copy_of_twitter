class HomeController < ApplicationController
  def index
    @tweet = Tweet.new
    @tweets = Tweet.order(created_at: :desc).page params[:page]
    
  end
end
