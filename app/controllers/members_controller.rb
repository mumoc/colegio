class MembersController < ApplicationController
  def index
    @members = Member.page(params[:page])
  end

  def show
    @member = Member.find params[:id]
    @json = @member.address.to_gmaps4rails 
  end
end
