class MembersController < ApplicationController
  def index
    members = params[:letter].nil? ? Member : Member.where('UPPER(last_name) like ?', "#{params[:letter].upcase}%")
    @members = members.page(params[:page])
  end

  def show
    @member = Member.find params[:id]
    @json = @member.addresses.to_gmaps4rails 
  end
end
