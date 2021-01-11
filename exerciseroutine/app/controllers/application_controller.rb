
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "Routine_secret"
  end
  get "/" do
    erb :index
  end
  helpers do
    def signed_in?
      !!current_user
    end
