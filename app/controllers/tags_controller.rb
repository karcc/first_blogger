class TagsController < ApplicationController
before_filer :require_login, only: [:destroy]

	def index
		@tag = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.delete

		flash.notice = "'#{@tag.name}' Has Been Deleted."
		redirect_to tags_path
	end

	def edit
		@tag = Tag.find(params[:id])
	end

	def update
		@tag = Tag.find(params[:id])
		@tag.update

		flash.notice = "'#{@tag.title}' Has Been Updated!"

		redirect_to tag_path(@tag)
	end
	

end


