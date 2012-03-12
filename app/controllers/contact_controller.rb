class ContactController < ApplicationController
  before_filter :authenticate_member!, :except => :public_contact
  before_filter :validate_member

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
    Message.suggestion(current_member.first_name, message).deliver
    redirect_to root_path
  end

  private
  def validate_member
    redirect_to root_path unless current_member.payment
  end
end
