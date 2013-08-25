class SessionsController <ApplicationController

  def new
  end

  def create
    #get a handle on the user (username)
    user = User.find_by(username: params[:username])

    #if user exists, call 'authenticate' and pass in the password
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you're logged in"
      redirect_to root_path
    else 
      flash[:error] = "Sorry, something's srong with your username or password"
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You're logged out."
    redirect_to root_path
  end

end
