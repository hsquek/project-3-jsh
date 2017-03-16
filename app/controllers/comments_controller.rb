class CommentsController < ApplicationController
  before_action :complaint_item, :all_comments_for_complaint
  respond_to :html, :js

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
  end

  def destroy
    @complaint = Complaint.find(params[:complaint_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    @comments = Comment.all
  end



  private
  #set the current complaint item
  def complaint_item
    @complaint = Complaint.find(params[:complaint_id])
  end

  def all_comments_for_complaint
    @comments = Comment.where(complaint_id: params[:complaint_id])
  end
end
