class ContactController < ApplicationController
  
  def public_contact
    sender = { name: params[:nombre], email: params[:email], tel: params[:tel] }
    message = params[:text]
    Message.contact_mail(sender, message).deliver
    redirect_to root_path
  end

  def new
  end  

  def create
    message = params[:text]
    Message.suggestion(message, current_member.first_name).deliver
    redirect_to root_path
  end
end
