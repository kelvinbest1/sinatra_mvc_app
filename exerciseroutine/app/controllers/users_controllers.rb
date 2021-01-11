class UsersController < ApplicationController
    # GET: /let the user go for the sign-up page --done
    get "/signup" do
      if signed_in?
        redirect '/routines'
      else
        erb :"/users/new.html"
      end
    end
    
    post "/signup" do
 
        if params[:name].empty? || params[:email].empty? || params[:password].empty?
          redirect "/signup"
        else
          
          @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])
          # @user.save
          session[:user_id] = @user.id
          redirect "/routines"
        end
      end

      post "/signin" do
        @user = User.find_by(:name => params[:name])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect '/routines'
        else
          redirect "/signup"
        end
      end
