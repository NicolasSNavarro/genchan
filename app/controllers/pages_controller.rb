class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @posts = []
  end
end
