get "/routines" do
      
    if signed_in?
     
      @user = User.find(session[:user_id])
     

        @routines = Routine.where(user_id: current_user)
    
        erb :"routines/index.html"
    else
      redirect "/signin"
    end
  end