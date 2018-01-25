class PostsController < ApplicationController
  def index
    @post = Post.all
  end
  def new
    @post = Post.new
  end
  def edit
    @post = Post.find(params[:id])
  end
  def show
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
     if @post.update_attributes(post_params)
       redirect_to post_path
     else
       render "edit"
     end
  end
  def create
    @post = Post.new(post_params)
     if @post.save
       redirect_to post_path(@post)
     else
       render "new"
     end
  end
  def destroy
    @post = Post.find(params[:id])
     if @post.delete
       redirect_to posts_index_path
     else
       render "destroy"
     end
  end

  private

   def post_params
     params.require(:post).permit(:title , :content)
   end
end
