class PostsController < ApplicationController
	skip_before_filter :verify_authenticity_token
  attr_accessor :like
	def index
  		@posts = Post.all
  end

  def welcome
    @posts = Post.all
  end

  def report
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

  def search
    @posts = buscar(params[:text])
    render 'index'
  end

  def buscar(texto)
      posts = Array.new 
      aux = Post.all
      if texto != "" && texto != nil
          aux.each do |i|
          if (i.correspondeApost(texto))
              posts.push(i)
          end
        end
      else
          posts = aux
      end
      return posts
    end

	private
  	def post_params
    	params.require(:post).permit(:title, :text, :like)
  	end
end
