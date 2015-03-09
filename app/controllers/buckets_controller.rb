class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]
  respond_to :js

  before_filter :set_post, except: [:destroy]

  # GET /buckets
  # GET /buckets.json
  def index
    @buckets = Bucket.all
  end

  # GET /buckets/1
  # GET /buckets/1.json
  def show
  end

  # GET /buckets/new
  def new
    @bucket = Bucket.new
  end

  # GET /buckets/1/edit
  def edit
  end

  # POST /buckets
  # POST /buckets.json
  def create
    if @post
      @bucket = @post.buckets.new(bucket_params)
    else
      @bucket = Bucket.new(bucket_params)
    end

    respond_to do |format|
      if @bucket.save
        @buckets = Bucket.all
        format.html { redirect_to @bucket, notice: 'Bucket was successfully created.' }
        format.json { render :show, status: :created, location: @bucket }
        format.js { render :index}
      else
        format.html { render :new }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
        format.js { render :failure }
      end
    end
  end

  # PATCH/PUT /buckets/1
  # PATCH/PUT /buckets/1.json
  def update
    respond_to do |format|
      if @bucket.update(bucket_params)
        format.html { redirect_to @bucket, notice: 'Bucket was successfully updated.' }
        format.json { render :show, status: :ok, location: @bucket }
      else
        format.html { render :edit }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckets/1
  # DELETE /buckets/1.json
  def destroy
    @bucket.destroy
    respond_to do |format|
      format.html { redirect_to buckets_url, notice: 'Bucket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_post
    @post = Post.find params[:post_id] if params[:post_id]
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_bucket
    @bucket = Bucket.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bucket_params
    params.require(:bucket).permit(:name, :description)
  end
end
