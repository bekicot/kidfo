class SitrequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :sitrequest_params

  def new
    @sit = Sit.find(params[:sit_id])
    @sitrequest = @sit.sitrequests.new
    @sitrequest.invite_kind = 'for_sitter'

  end

  def create
    @sit = Sit.find(params[:sit_id])
    @sitrequest = @sit.sitrequests.new sitrequest_params
    @sitrequest.status = :pending

    if @sitrequest.save
      redirect_to user_path(current_user), notice: "Sit request is sent to #{@sitrequest.email}"
    else
      render :new
    end

  end

  def show
  end

  def accept
    @invite.accept!
    redirect_to user_path, notice: 'Accept invite successfully!'
  end

  def reject
    @invite.reject!
    redirect_to user_path, notice: 'Reject invite successfully!'
  end

  def cancel
    @invite.cancel!
    redirect_to root_path, notice: 'Cancel invite successfully!'
  end

  private

  def sitrequest_params
    params.require(:sitrequest).permit(:email, :sit_id)
  end

  def set_invite
    @invite = Invite.find_by_code params[:id]
  end
end

