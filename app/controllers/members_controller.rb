class MembersController < ApplicationController
  has_scope :per, default: 20
  def index
    members = Member.visibles(params[:letter])
    @members = members.page(params[:page])
  end

  def testing
    members = Member.visibles(params[:letter])
    @members = members.page(params[:page])
    page = render_to_string :index
    render :text => page
  end

  def show
    @member = Member.find params[:id]
    @json = @member.addresses.to_gmaps4rails
  end
end
