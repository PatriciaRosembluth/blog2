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
  		@post = Post.new(params[:post].permit(:title, :text, :category))
  		if @post.save
    		redirect_to '/posts', notice: 'El post fue creado exitosamente'
  		else
    		render 'new'
  		end
	end

  def puts_like
    @post = Post.find(params[:id])
    if @post.likes != nil
      @post.likes = @post.likes+1
    else
      @post.likes=1
    end
    @post.save
    redirect_to '/posts' 
  end

  def dislike
    @post = Post.find(params[:id])
    if @post.likes != nil && @post.likes != 0
      @post.likes = @post.likes-1
    else
      @post.likes=0
    end
    @post.save
    redirect_to '/posts' 
  end

	def show
		@post=Post.find(params[:id])		
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
  		@post = Post.find(params[:id]) 
  		if @post.update(params[:post].permit(:title, :text, :category))
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

  def categoria
    @posts = buscar_categoria(params[:category])
    render 'index'
  end

  def buscar_categoria(categoria)
    posts = Array.new 
    aux = Post.all
    if categoria != "" && categoria != nil
      aux.each do |i|
        if (i.EstaEnPost(categoria))
          posts.push(i)
        end
      end
    else
      posts = aux
    end
      return posts
  end  

  def contar_palabras_post(texto)
    texto.split.count
  end

  def contar_palabras
    @post = Post.find(params[:id])
    suma=0
    @post.comments.each do |comment|
      suma+=comment.contar_palabras_comment(comment.body)
    end
    suma+=@post.contra_palabras_post(@post.text)
    suma
  end

	private
  	def post_params
    	params.require(:post).permit(:title, :text, :category)
  	end
end
