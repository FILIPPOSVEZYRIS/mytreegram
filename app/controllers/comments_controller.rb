class CommentsController < ApplicationController	

	def create
		@photo=Photo.find(params[:photo_id])
		@comment=@photo.comments.build(comment_params)
		@comment.user_id=current_user.id
		@comment.save
		if @comment.save
			flash[:notice] = "Comment added!"
		else
			flash[:alert]= "Something went wrong"
		end
    redirect_to :back
	end

	def destroy
		@photo=Photo.find(params[:photo_id])
		@comment=@photo.comments.find(params[:id])
		if @photo.user_id == current_user.id
			@comment.destroy
			flash[:notice] = "comment deleted!"
		else
			if @comment.user_id == current_user.id
				@comment.destroy
				flash[:notice] = "comment deleted!"
			end
		end
		redirect_to :back
	end

	private
	def comment_params
	    params.require(:comment).permit(:text)
	end
end