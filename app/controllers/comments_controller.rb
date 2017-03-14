class CommentsController < ApplicationController
  before_action :complaint_item

  def index
    @comments = Comment.all
  end
  def new
    @complaint = Complaint.find(params[:complaint_id])
    @comment = Comment.new
  end

  def create

    @comment = Comment.new text: params[:comment][:text], user_id: current_user.id, complaint: @complaint
    puts "comment is :#{@comment.inspect}"
      @comment.save
      puts "comment is :#{@comment.inspect}"
      redirect_to "/complaints/#{@comment.complaint_id}"
  end



  private
  #set the current complaint item
  def complaint_item
    @complaint = Complaint.find(params[:complaint_id])
  end
end
