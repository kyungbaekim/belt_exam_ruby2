class MembersController < ApplicationController
  def create
    member = Member.new(member_params)
    member.save
    redirect_to '/groups/' + params[:member][:group_id].to_s
  end

  def destroy
    member = Member.where(group_id: params[:id], user_id: session[:user_id])
    Member.delete(member)
    redirect_to '/groups/' + params[:id].to_s
  end

  private
    def member_params
      params.require(:member).permit(:user_id, :group_id)
    end
end
