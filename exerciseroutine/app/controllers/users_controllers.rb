class UsersController < ApplicationController
    # GET: /let the user go for the sign-up page --done
    get "/signup" do
      if signed_in?
        redirect '/routines'
      else
        erb :"/users/new.html"
      end
    end
    