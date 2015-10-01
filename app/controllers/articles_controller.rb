class ArticlesController < ApplicationController
before_filter :require_login, except: [:index, :show]

	include ArticlesHelper
	def index
		@article = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article_id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
			#title: params[:article][:title],
			#body: params[:article][:body])
		@article.save

		flash.notice = "'#{@article.title}' Has Been Created"
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "'#{@article.title}' Has Been Deleted."
		redirect_to articles_path
		
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "'#{@article.title}' Has Been Updated!"

		redirect_to article_path(@article)
	end
end
