class DaysController < ApplicationController
    get "/days" do
        if logged_in?
            @user = current_user
            @days = @user.days
            erb :"/days/days"
        else
            redirect "/login"
        end
    end

    get "/days/today" do
        if logged_in?
            @user = current_user
            @day = Day.find_by(date: Date.today, user_id: @user.id)
            if @day
                redirect "/days/#{@day.id}"
            else
                @day = Day.create(date: Date.today, calories: 0, protein: 0, carbs: 0, fat: 0)
                @user.days << @day
                redirect "/days/#{@day.id}"
            end
        else
            redirect "/login"
        end
    end

    get "/days/create" do

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


    #should be patch
    post "/days/:id" do
        @user = current_user
        @day = Day.find(params[:id])
        if params[:name] != ""
            @food = Food.create(params[:food])
            @user.foods << @food
            @day.foods << @food
            @day.update_stats
            redirect "/days/#{@day.id}"
        else
            redirect "/days/#{@day.id}/edit"
        end 
    end

    delete "/days/:id" do

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

    get "/days/:id/delete" do

    end
end