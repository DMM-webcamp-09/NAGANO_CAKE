class Member::MembersController < ApplicationController

  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end
  
  def update
  @member = current_member
  if @member.update(member_params)
      redirect_to members_show_path
  else
      render :edit
  end
  end

  def unsubscribe
    @member = Member.find_by(email: params[:email])
  end
  
  def withdraw
    @member = current_member
    @member.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private

  def member_params
    params.require(:member).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone_number)
  end
  

end
