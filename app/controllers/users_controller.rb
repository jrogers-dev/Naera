class UsersController < ApplicationController

    get "/login" do
        if logged_in?
            redirect "/days/today"
        else
            erb :"/users/login"
        end
    end

    post "/login" do
        if params[:email] != "" && params[:password] != ""
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect "/days/today"
            else 
                redirect "/login"
            end
        else 
            redirect "/login"
        end
    end

    get "/signup" do
        if logged_in?
            redirect "/days/today"
        else
            erb :"/users/signup"
        end
    end

    post "/signup" do
        if params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect "/days/today"
        else
            redirect "/signup"
        end
    end

    get "/logout" do
        if logged_in?
            session.clear
            redirect "/login"
        else
            redirect "/login"
        end
    end
end
