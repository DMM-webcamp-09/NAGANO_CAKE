class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  def index
  @members = Member.all.page(params[:page]).per(10)
  end

  def show
  @member = Member.find(params[:id])
  end

  def edit
  @member = Member.find(params[:id])
  end

  def update
  @member = Member.find(params[:id])
  @member.update(member_paramas)
  redirect_to admin_member_path(@member.id)
  end

  private
  def member_paramas
    params.require(:member).permit(:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:phone_number,:email,:address,:is_deleted)
  end



end
