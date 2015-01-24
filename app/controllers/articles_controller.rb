class ArticlesController < ApplicationController

	def index

	    if params[:status] && params[:category]
	      @articles = Article.where(status: params[:status],category: params[:category])
	    else
			@articles = Article.all.order(created_at: :desc)
	    end

	end

	def show
		@article = Article.find(params[:id])
		@comments = @article.comments.order(created_at: :desc)
		@new_comment = Comment.new
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(params.require(:article).permit(:title, :body, :category, :status))
		
		if @article.save
			redirect_to articles_path
		else
			render :new
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(params.require(:article).permit(:title, :body, :category, :status))
      		flash[:success] = "Article successfully saved!"
			redirect_to article_path
		else
			render :edit
		end
	end

	def destroy
		@article = Article.find(params[:id])
    
    	@article.destroy
    
      	flash[:danger] = "Article has been deleted!"
    	redirect_to articles_path
	end

end
