class Member::MembersController < ApplicationController

  def show
  end

  def edit
  end

  def update
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
  

end
