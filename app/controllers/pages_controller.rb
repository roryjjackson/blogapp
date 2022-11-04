class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @categories = Category.all
  end
end
