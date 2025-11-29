class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @post = Post.new
    @posts = Post.all
  end
end
