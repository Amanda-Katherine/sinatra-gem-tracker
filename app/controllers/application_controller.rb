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
        flash[:message] = "You aren't allowed to change the tune of this gem. Franie boy says, permission denied."
        redirect to '/gems'
      end
    end

    def sort_gems
      @gems = Gemstone.all.sort_by {|gem| gem.description.length}.reverse.sort_by{|gem| gem.name.downcase}.uniq {|gem| gem.name.downcase}
    end
  end

end
