class Admin::MembersController < ApplicationController
    
  def index
  @menbers = Menber.all
  end
  
  def show
  @menbers = Menber.find(params[:id])
  end
  
  def edi
  @menbers = Menber.find(params[:id])
  end
  
  def update
  @menbers = Menber.find(params[:id])
  @member.update(member_paramas)
  redirect_to admin_member_path(@menber.id)
  end
  
end
