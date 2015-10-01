class ArticlesController < ApplicationController
	before_action :article_comments, only: [:show, :edit]
	def article_comments
		@article = Article.find(params[:id])
  	    @article_comments = @article.comments.reverse_order	    
	end
	#index
	def index
		@articles=Article.all
	end
	#show
	def show
		@article=Article.find(params[:id])
	end
	#new
	def new
		@article=Article.new
	end
	#create, after new post submit, come here
	def create
		@article=Article.new(article_params)
		@article.save

		if @article.save
			redirect_to @article	
		else
			render 'new'
		end	

	end
	#edit
	def edit
		@article=Article.find(params[:id])
	end
	#update
	def update
   		@article = Article.find(params[:id])
   		@article.update(article_params)
   		redirect_to articles_url
	end
	#delete article
	def destroy
	   @article = Article.find(params[:id])
	   @article.destroy
	   redirect_to articles_path
	end


	def article_params
		params.require(:article).permit(:title, :content)
	end


end
