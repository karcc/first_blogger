module TagsHelper
	def tag_params
		params.require(:tags).permit(:tag_list)
	end
end
