class FoodsController < ApplicationController
    get "/foods" do
        if logged_in?
            @user = current_user
            @foods = @user.foods
            erb :"/foods/foods"
        else
            redirect "/login"
        end
    end

    get "/foods/:id" do
        if logged_in?
            @user = current_user
            @food = Food.find(params[:id])
            if @food.user_id == @user.id
                erb :"/days/show1"
            else 
                redirect "/foods"
            end
        else
            redirect "/login"
        end
    end

    #post "/days/:id" do
    #    @user = current_user
    #    @day = Day.find(params[:id])
    #    if params[:name] != ""
    #        @food = Food.create(params[:food])
    #        @user.foods << @food
    #        @day.foods << @food
    #        @day.update_stats
    #        redirect "/days/#{@day.id}"
    #    else
    #        redirect "/days/#{@day.id}/edit"
    #    end 
    #end

    get "/foods/:id/edit" do
        if logged_in?
            @food = Food.find(params[:id])
            @user = current_user
            if @food.user_id == @user.id
                erb :"/foods/edit"
            else
                redirect "/foods"
            end
        else
            redirect "/login"
        end
    end
end