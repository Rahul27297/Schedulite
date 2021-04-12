#source: https://medium.com/full-taxx/how-to-add-likes-to-posts-in-rails-e81430101bc2
#source: https://arielvictor1234.medium.com/ruby-rails-how-to-create-a-like-button-3c178e65b0a

class LikesController < ApplicationController
  before_action :find_course

  def create
    if already_liked
	flash[:notice] = "Looks like you already indicated your interest!"
    else
        @course.likes.create(user_id: params[:username])
    end
    redirect_to course_detail_url(@course.id) 
  end

  private

  def find_course
    @course = Course.find(params[:course_id])
  end

  def already_liked
    Like.where(user_id: params[:username], course_id: params[:course_id]).exists?
  end

end

