class MainController < ApplicationController
  def index
    session_user_id = session[:user_id]

    if session_user_id
      @user = User.find_by(id: session_user_id)
      if !@user
        redirec_to_signup
      end
    else
      redirec_to_signup
    end
  end

  def redirec_to_signup
    redirect_to sign_up_path
  end 
end
