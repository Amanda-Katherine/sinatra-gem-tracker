class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get "/" do
    erb :homepage
  end

  helpers do

    def redirect_if_not_logged_in
      if !current_user
        #insert flash message about must be logged in to see page
        redirect '/login'
      end
    end

    def logged_in? 
      !!current_user
    end

    def current_user
      @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end
