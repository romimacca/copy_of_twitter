class HomeController < ApplicationController
  def index
    if signed_in?
      @tweets = Tweet.tweets_for_me(current_user).order(created_at: :desc).page params[:page]
      @tweet = Tweet.new
    else
      @tweets = Tweet.order(created_at: :desc).page params[:page]
    end
    
  end

  def explore
    @tweet = Tweet.new
    @tweets = Tweet.order(created_at: :desc).page params[:page]
    render template: 'home/index' 
  end
end
