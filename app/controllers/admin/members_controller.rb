class Admin::MembersController < Admin::ResourceController
  respond_to :csv

  def report
    @members = Member.all
    respond_with @members
  end
end