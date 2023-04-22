class SessionsController < ApplicationController
    def new
    end

    def create
        email = params[:email]
        password = params[:password]

        login(email, password)
    end

    def login(email, password)
        user = User.find_by(email: email)

        if user.present? && user.authenticate(password)
            session[:user_id] = user.id
            redirect_to root_path, notice: "Signed in successfully"
        else
            flash[:alert] = "Invalid login credentials"
            render :new, status: :unauthorized
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to sign_up_path, notice: "Signed out successfully!"
    end
end