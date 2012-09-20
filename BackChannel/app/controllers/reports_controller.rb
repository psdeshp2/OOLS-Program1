class ReportsController < ApplicationController

  def index
    @all_users_for_report = User.all
  end

end