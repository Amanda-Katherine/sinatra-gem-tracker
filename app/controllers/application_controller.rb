class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  register Sinatra::Flash

  get "/" do
    erb :homepage
  end

  get '/corneal' do
    erb :welcome
  end

  helpers do

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:message] = "Whoops, looks like you need to log in!"
        redirect '/login'
      end
    end

    def logged_in? 
      !!current_user
    end

    def current_user
      @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def gem_creator?(gem)
      gem.user == current_user
    end


    def redirect_if_not_creator(gem)
      if !gem_creator?(gem)
        flash[:message] = "Looks like you didn't create this gem. Want to change the tune of this gem? Frank Sinatra says, permission denied."
        redirect to '/gems'
      end
    end
  end

end
