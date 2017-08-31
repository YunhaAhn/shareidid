class CommentsController < ApplicationController
  def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)
      @comment.user = current_user
      @comment.save
      
      redirect_to post_path(@post)
      
 end
   
  
  def edit
   @post = Post.find(params[:post_id])
   @comment = Comment.find(params[:id])
   authorize! :update, @comment
  end

  def update
    @post = Post.find(params[:id])
    @post.update(content_params)
    
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    # @content.delete #only content
    @comment.destroy #content 자식들까지 삭제
    
    redirect_to @post # 'http://~' 절대경로
    # redirect_to contents_path #'/contents' 상대경로
  end
  
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
