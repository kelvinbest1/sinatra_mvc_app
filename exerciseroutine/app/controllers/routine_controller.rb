get "/routines" do
      
    if signed_in?
     
      @user = User.find(session[:user_id])
     

        @routines = Routine.where(user_id: current_user)
    
        erb :"routines/index.html"
    else
      redirect "/signin"
    end
  end

  get "/routines/new" do
    if signed_in?
      @user = User.find_by(id: session[:user_id])
      erb :"/routines/new.html"
    else
      redirect "/signin"
    end
  end