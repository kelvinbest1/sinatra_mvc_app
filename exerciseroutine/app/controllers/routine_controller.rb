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

  post "/routines" do
    
    if signed_in?
      @user = User.find(session[:user_id])
    

      if params[:exercise].empty?
        redirect "/routines/new"
      else
      @user = User.find_by(:id => session[:user_id])
      @routine = Routine.new
      @routine.exercise = params[:exercise]
      @routine.user_id = @user.id
      @routine.save

        
        redirect "/routines"
      end
    else
      redirect "/signin"
    end
  end

  get '/routines/:id' do
    if signed_in?
      # @user = User.find_by(id: session[:user_id])
      @routine = Routine.find(params[:id])
      if @routine && @routine.user == current_user
     
      erb :'/routines/show.html'
    else
      redirect "/signin"
    end
    else
      redirect '/signin'
    end
  end