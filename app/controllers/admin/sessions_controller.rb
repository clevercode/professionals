module Admin
  class SessionsController < ApplicationController

    def new
    end

    def create
      admin = Administrator.authenticate(params[:email], params[:password])
      if admin
        session[:admin_id] = admin.id
        redirect_to admin_root_url
      else
        flash.now.alert = "Invalid email or password"
        render :new
      end
    end

    def destroy
      session[:admin_id] = nil
      redirect_to root_url
    end

  end
end
