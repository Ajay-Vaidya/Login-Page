class SessionsController < ApplicationController

  def create
      user = User.find_by(company_id: login_params[:company_id])
      if user && user.authenticate(login_params[:password])
        session[:user_id] = user.id
        redirect_to 'welcome'
      else
        flash[:login_errors] = ['Either Username or Password is wrong']
        redirect_to '/'
      end
  end

  private def login_params
    params.require(:login).permit(:company_id,:username,:password)
  end
end
