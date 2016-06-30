class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def create
    group = Group.new(group_params)
    if group.save
      Member.create(user_id: session[:user_id], group_id: group.id)
      redirect_to '/groups'
    else
      flash[:errors] = group.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @group = Group.find(params[:id])
    @members = Member.where(group_id: params[:id])
  end

  def destroy
    Group.find(params[:id]).destroy
    redirect_to '/groups'
  end

  private
    def group_params
      params.require(:group).permit(:name, :description, :user_id)
    end
end
