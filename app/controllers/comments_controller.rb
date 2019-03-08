class CommentsController < ApplicationController
  def make
  	@comment = Comment.new(id: params[:id])
  end

  def reply
  	@comment = Comment.new(
  		comment: params[:comment],
  		user_id: @current_user.id,
  		post_id: params[:id],
      user_image: @current_user.image_name,
      username: @current_user.name,
  		)
  	if @comment.save
      redirect_to("/posts/#{@comment.post_id}")
    else
      render("comments/#{@comment.id}")
    end
  end

end
