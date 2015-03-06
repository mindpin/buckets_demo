class PostsController < ApplicationController
  #before_action :set_post, only: [:edit, :destroy]

  respond_to :html
  #respond_to :js, only: [:new, :create]

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    @post = Post.find params[:id]
    
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    respond_with(@post)
  end

  private
  #def set_post
    #@post = current_user.posts.find(params[:id])
  #end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end

