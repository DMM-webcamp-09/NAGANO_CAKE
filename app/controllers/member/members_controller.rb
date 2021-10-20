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

  def withdrow
    @member = current_member
    @member.update(is_deleted: true)
    redirect_to products_path
  end

end
