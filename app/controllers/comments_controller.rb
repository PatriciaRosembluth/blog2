class CommentsController < ApplicationController
	def create
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.create(params[:comment].permit(:commenter, :body))
    	redirect_to post_path(@post)
  	end

  	def contar_palabras_comment(texto)
      texto.split.count
    end
end
