class ArticlesController < ApplicationController

	def index
		@articles = Article.all.order(created_at: :desc)
	end

	def show
		@article = Article.find(params[:id])
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

	def destroy
		@article = Article.find(params[:id])
    
    	@article.destroy
    
      	flash[:danger] = "Article has been deleted!"
    	redirect_to articles_path
	end

end
