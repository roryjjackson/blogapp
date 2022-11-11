class PagesController < ApplicationController
  # before_action :authenticate_user!

  def home
    @posts = Post.all
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window: render_to_string(partial: "info_window", locals: {post: post}),
        image_url: helpers.asset_url("https://res.cloudinary.com/dfipoufmj/image/upload/v1666713742/rory_zoeandcam_a29pkj.jpg")
      }
    end
  end
end
