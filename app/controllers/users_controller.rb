class UsersController < ApplicationController
    
    get '/signup' do
        if logged_in? 
            redirect to '/gems'
        else 
            erb :'users/signup'
        end
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
        
        erb :"/users/users_gems"
    end

    get '/login' do
        if logged_in?
            redirect to '/gems'
        else 
            erb :'users/login'
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/gems'
        else
            #insert flash message about credentials not matching
            redirect to '/signup'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end
end