class SitrequestsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_invite, only: [:show, :accept, :reject, :cancel]
  #load_and_authorize_resource param_method: :invite_params

  def new
    @sit = Sit.find(params[:sit_id])
    @sitrequest = @sit.sitrequests.new
    @sitrequest.invite_kind = 'for_sitter'
  end

  def create
    @sit = Sit.find(params[:sit_id])
    @sitrequest = @sit.sitrequests.new sitrequest_params
    @sitrequest.status = :pending

    @sit.sitrequests.create(sitrequest_params.merge(sit_id: @sit.id))
    #@invite = current_user.invites.new invite_params

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

