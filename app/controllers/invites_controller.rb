class InvitesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invite, only: [:show, :accept, :reject, :cancel]
  load_and_authorize_resource param_method: :invite_params

  def new
    @invite = current_user.invites.new

    case (@invite.invite_kind || params[:invite_kind])
    when 'for_spouse'
      @invite.invite_kind = 'for_spouse'
    when 'for_sitter'
      @invite.invite_kind = 'for_sitter'
    else
      redirect_to root_path
    end
  end

  def create
    @invite = current_user.invites.new invite_params
    @invite.status = :pending
    @invite.family = current_user.family

    if @invite.save
      redirect_to root_path, notice: "Invite is sent to #{@invite.email}"
    else
      render :new
    end
  end

  def show
  end

  def accept
    @invite.accept!
    redirect_to root_path, notice: 'Accept invite successfully!'
  end

  def reject
    @invite.reject!
    redirect_to root_path, notice: 'Reject invite successfully!'
  end

  def cancel
    @invite.cancel!
    redirect_to root_path, notice: 'Cancel invite successfully!'
  end

  private
  def invite_params
    params.require(:invite).permit :email, :invite_kind
  end

  def set_invite
    @invite = Invite.find_by_code params[:id]
  end
end
