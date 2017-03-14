class ComplaintsController < ApplicationController
  def index
    @complaints = Complaint.all
  end

  def new
    @complaint = Complaint.new
  end

  def create
    @complaint = Complaint.new(complaint_params)
      puts complaint_params
    if @complaint.save
      redirect_to complaints_path
    else
      render :new
    end
  end

  def show
    @complaint = Complaint.find(params[:id])
    @comments = Comment.where(complaint_id: @complaint.id)
    puts "in the show of complaints comments are #{@comments.inspect}"
  end

  private
    def complaint_params
      params.require(:complaint).permit(:text, :title).merge(user: current_user)
    end
end
