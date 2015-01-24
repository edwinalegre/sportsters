class CommentsController < ApplicationController

	def create
		@article = Article.find(params[:article_id])

		@comment = @article.comments.new(comment_params)

		if @comment.save
			redirect_to article_path(@article)
		else
			render article_comments
		end
	end

	def comment_params
		params.require(:comment).permit(:body, :commentor)
	end

end