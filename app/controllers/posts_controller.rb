class PostsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
  		@posts = Post.all
  end

  def welcome
    @posts = Post.all
  end

	def new
 	 	@post = Post.new
	end
 
	def create
  		@post = Post.new(params[:post].permit(:title, :text))
  		if @post.save
    		redirect_to '/posts', notice: 'El post fue creado exitosamente'
  		else
    		render 'new'
  		end
	end

	def show
		@post=Post.find(params[:id])		
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
  		@post = Post.find(params[:id]) 
  		if @post.update(params[:post].permit(:title, :text))
    		redirect_to '/posts', notice: 'El post fue actualizado exitosamente'
  		else
    		render 'edit'
  		end
	end

	def destroy
  		@post = Post.find(params[:id])
  		@post.destroy
 		redirect_to '/posts', notice: 'El post fue eliminado'
	end

	private
  	def post_params
    	params.require(:post).permit(:title, :text)
  	end
end
