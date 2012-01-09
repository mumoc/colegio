class MembersController < ApplicationController
  def index
    @members = Member.page(params[:page])
  end

  def show
    @member = Member.find params[:id]
  end
end
