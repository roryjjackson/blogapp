class AboutController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = policy_scope(Post)
    @posts = Post.all
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude
      }
    end
  end
end
