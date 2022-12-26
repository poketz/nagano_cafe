class Admin::SessionsController < Devise::SessionsController
  def new
    @admin = Admin.new
  end
end
