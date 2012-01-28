class MembersController < ApplicationController
  def index
    members = Member.visibles(params[:letter])
    @members = members.page(params[:page])
  end

  def show
    @member = Member.find params[:id]
    @json = @member.addresses.to_gmaps4rails
  end
end
