class FoodsController < ApplicationController
    delete "/foods/:id" do
        if logged_in?
            @food = Food.find(params[:id])
            @user = current_user
            if @food.user_id == @user.id
                @day = Day.find(@food.dayfood.day.id)
                @food.destroy
                redirect "/days/#{@day.id}"
            else
                redirect "/days/today"
            end
        else
            redirect "/login"
        end
    end

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