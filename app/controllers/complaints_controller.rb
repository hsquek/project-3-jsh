class ComplaintsController < ApplicationController
  before_action :is_not_admin?, only: [:index, :new, :create, :show]
  respond_to :html, :js

  def index
    @complaints = Complaint.all
  end

  def new
    @complaint = Complaint.new
  end

  def update
    @complaint = Complaint.find(params[:id])
    # @complaint.update(update_complaint_params)
    @complaint.toggle!(:active)
    @complaint.save
    @complaints = Complaint.all
    redirect_to complaints_path
  end

  # def change_complaint_status
  #   @complaint = Complaint.find(params[:id])
  #   @complaint.toggle!(:active)
  #   @complaint.update_attributes(params[:active])
  #   redirect_to complaints_path
  # end

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

def destroy
  @complaint = Complaint.find(params[:id])
  @complaint.destroy
  @complaints = Complaint.all
end

  private
    def complaint_params
      params.require(:complaint).permit(:text, :title, :active).merge(user: current_user)
    end

    def update_complaint_params
      params.require(:complaint).permit(:active)
    end

    def is_not_admin?
      if current_user.an_admin
        false
      else
        true
      end
    end
end
