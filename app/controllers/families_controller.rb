class FamiliesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :family_params

  def new
    # check_current_user_family
    @family = Family.new
    @family.kids.build
  end

  def create
    check_current_user_family
    @family = Family.new family_params
    parenthood = Parenthood.new family: @family, user: current_user
    if @family.save && parenthood.save
      current_user.role = 1
      redirect_to root_path
    else
        render :new, status: :unprocessable_entity
    end
  end

  def show
    @family = Family.find(params[:id])
  end

  def edit
    @family = current_user.family
  end

  def update
    @family = current_user.family
    if @family.update family_params
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def family_params
    params.require(:family).permit [:name, :avatar, :physicianname, :physicianphone, :insuranceprovider, :health_ins_enrollee_id, :health_ins_group_num, :emerg_contact_1, :emerg_contact_1_phone, :emerg_contact_2, :emerg_contact_2_phone], kids_attributes: [:id, :name, :avatar, :birthdate, :gender, :bedtime, :sleeproutine, :nap1, :nap2, :nap3, :naproutine, :allergies, :chores, :nonos, :_destroy]
    end

  def check_current_user_family
    redirect_to root_path, notice: 'You already have a family!' if current_user.family
  end
end
