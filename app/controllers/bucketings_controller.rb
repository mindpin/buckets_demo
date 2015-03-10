class BucketingsController < ApplicationController
  respond_to :js
  before_filter :set_post

  def create
    @bucket = Bucket.find(params[:bucket_id])
    @bucket.posts << @post unless @bucket.posts.include?(@post)
    render :show
  end

  def destroy
    @bucket = Bucket.find(params[:id])
    @post.buckets.delete @bucket
    render :show
  end

  private
  def set_post
    @post = Post.find params[:post_id] if params[:post_id]
  end
end
