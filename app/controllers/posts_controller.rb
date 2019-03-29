class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
    @comments = Comment.all.order(created_at: :desc)
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(
      id: params[:id],
      content: params[:content],
      post_title: params[:post_title],
      pic_image: "default_pic.jpg",
      user_id: @current_user.id
    )

    if params[:image]
      @name = params[:image].original_filename
      #pic_imageの名前をデータベースに保存
      @post.pic_image = "#{@name}"
       #投稿した画像を保存
      image = params[:image]
      File.binwrite("public/pic_images/#{@post.pic_image}", image.read)
    end

  	if @post.save
  	  flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

    def edit
    	@post = Post.find_by(id: params[:id])
    end

  def update
    	@post = Post.find_by(id: params[:id])

      #ポストタイトル
      @post.post_title = params[:post_title]

      #画像
    if params[:image]
      @name = params[:image].original_filename
      @post.pic_image = "#{@name}"
      image = params[:image]
      File.binwrite("public/pic_images/#{@post.pic_image}", image.read)
    end

      #ポスト内容
    	@post.content = params[:content]

    if @post.save
    	flash[:notice] = "投稿を編集しました"
    	redirect_to("/posts/index")
    else
    	render("/posts/edit")
  	end
  end

  def destroy
  	@post = Post.find_by(id: params[:id])
    @comments = Comment.where(post_id: @post.id)
  	@post.destroy
  	flash[:notice] = "投稿を削除しました"
  	redirect_to("/posts/index")
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id !=  @current_user.id
      flash[:notice] = "don't have permission"
      redirect_to("/posts/index")
    end
  end

end
