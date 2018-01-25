class PostsController < ApplicationController
  def index
    @post = Post.all
  end
  def new
    @post = Post.new
  end
  def edit
    #code
  end
  def show
    @post = Post.find(params[:id])
  end
  def update
    #code
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
    #code
  end

  private

   def post_params
     params.require(:post).permit(:title , :content)
   end
end
