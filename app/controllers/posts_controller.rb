class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]
  after_action { authorize(@post || Post) }

  # GET /posts or /posts.json
  def index
    @breadcrumbs = [
      { content: "Posts", href: posts_path },
      { content: "Page #{params[:page] || 1}"}
    ]
    @q = policy_scope(Post).includes(author: :avatar_attachment).published.page(params[:page]).per(10).ransack(params[:q])
    @posts = @q.result
  end

  # GET /posts/1 or /posts/1.json
  def show
    set_meta_tags @post.to_meta_tags
    @breadcrumbs = [
      { content: "Posts", href: posts_path },
      { content: @post.to_s, href: post_path(@post) }
    ]
  end

  # GET /posts/new
  def new
    @breadcrumbs = [
      { content: "Posts", href: posts_path },
      { content: "New" }
    ]
    @post = policy_scope(Post).new
  end

  # GET /posts/1/edit
  def edit
    @breadcrumbs = [
      { content: "Posts", href: posts_path },
      { content: @post.to_s, href: post_path(@post) },
      { content: "Edit" }
    ]
  end

  # POST /posts or /posts.json
  def create
    @post = policy_scope(current_user.posts).new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def export
    respond_to do |format|
      format.csv do
        send_data(policy_scope(current_user.posts).to_csv, filename: "my_posts.csv")
      end
    end
  end

  private

  def set_post
    @post = policy_scope(Post).find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :published_at)
  end
end
