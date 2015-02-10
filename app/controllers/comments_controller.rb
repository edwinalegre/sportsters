class CommentsController < ApplicationController

	# Allows users to make comments to articles
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(comment_params)
		if @comment.save
			redirect_to article_path(@article)
		else
			redirect_to :back
		end
	end

	def comment_params
		params.require(:comment).permit(:body, :commentor)
	end

end