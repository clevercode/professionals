module Admin
  class SessionsController < ApplicationController
    before_filter :check_login_state, only: [:new]

    layout "admin"

    def new
    end

    def create
      admin = Administrator.authenticate(params[:email], params[:password])
      if admin
        session[:admin_id] = admin.id
        redirect_to admin_root_path
      else
        flash.now.alert = "Invalid email or password"
        render :new
      end
    end

    def destroy
      session[:admin_id] = nil
      redirect_to root_path
    end

    def check_login_state
      unless current_user.nil?
        redirect_to root_path
      end
    end
  end
end
