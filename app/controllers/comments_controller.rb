class CommentsController < ApplicationController	

	def create
		@photo=Photo.find(params[:photo_id])
		@comment=@photo.comments.create(comment_params)
		@comment.user_id=current_user.id
		@comment.save
		flash[:notice] = "Comment added!"
    	redirect_to :back
	end

	private
	def comment_params
	    params.require(:comment).permit(:text)
	end
end