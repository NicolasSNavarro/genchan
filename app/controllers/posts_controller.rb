class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post), notice: "Post has been created."
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post has been updated."
    else
      render :edit
    end
  end

  def generate_ai
    @post = Post.find(params[:id])
    response = Ai::GeneratePostContent.new(prompt: @post.body).call
    @post.update(prompt: response.content)
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
