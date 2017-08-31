class PostsController < ApplicationController
 def index
    @posts = Post.paginate(:page => params[:page])
    @posts_netflix = @posts.where(category_id: 1)
    
  end
  
  def index2
    @posts = Post.all
    
    @posts_dark = @posts.where(category_id: 3)
  end

  def index3
    @posts = Post.all
    @posts_blacklist = @posts.where(category_id: 2)
  end
  
  def show
    @post = Post.find(params[:id])
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
    # authorize! :write, @post
  end

  def create
    post = Post.new(post_params)
    post.save
    # authorize! :create, @post
    redirect_to :root
  
  end
  
  def edit
    # authorize_action_for @post
     @post = Post.find(params[:id])
  
  end

  def update
    @post = Post.find(params[:id])
    @post.update(content_params)
    
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy 
    
    redirect_to :root
  end
  
  def searchindex
    @posts = Post.all.reverse
    @posts = Post.search(params[:search])
    @post = Post.new
    @categories = Category.all 
    
  end
  
  
  private
    def post_params
    params.require(:post).permit(:title, :content, :category_id)
    end
  
  
end
