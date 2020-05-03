class DaysController < ApplicationController
    get "/days" do
        if logged_in?
            @days = Day.all
            erb :"/days/days"
        else
            redirect "/login"
        end
    end

    get "/days/:id" do
        if logged_in?
            @user = current_user
            @day = Day.find(params[:id])
            erb :"/days/show"
        else
            redirect "/login"
        end
    end

    post "/days/:id" do
        @day = Day.find(params[:id])
        if params[:content] != ""
            @day.update(content: params[:content])
            redirect "/days/#{@day.id}"
        else
            redirect "/days/#{@day.id}/edit"
        end 
    end

    get "/days/:id/edit" do
        if logged_in?
            @day = Day.find(params[:id])
            @user = current_user
            if @day.user_id == @user.id
                erb :"/days/edit"
            else
                redirect "/days"
            end
        else
            redirect "/login"
        end
    end
end