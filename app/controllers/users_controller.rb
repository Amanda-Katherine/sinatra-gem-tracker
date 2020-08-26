class UsersController < ApplicationController
    
    get '/signup' do
        if logged_in? 
            redirect to '/gems'
        end
            erb :'users/signup'
    end

    post '/signup' do
        @user=User.create(:username => params[:username].downcase, :password => params[:password]) #check if params works here as well
        if @user.save
            session[:user_id] = @user.id
            redirect to '/gems'
        else 
           #insert flash message 
            redirect to '/signup'
        end
    end

    get '/users/:slug' do 
        redirect_if_not_logged_in
        @user = User.find_by_slug(params[:slug])
        
        if !!@user
            erb :"/users/users_gems"
        else
            #insert flash message about username not existing
            redirect '/gems'
        end
    end

    get '/login' do
        if logged_in?
            redirect to '/gems'
        else 
            erb :'users/login'
        end
    end

    post '/login' do
        @user = User.find_by_username(params[:username])
        binding.pry
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to '/gems'
        else
            #insert flash message about credentials not matching
            erb :'users/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
        end

        redirect to '/'
    end
end