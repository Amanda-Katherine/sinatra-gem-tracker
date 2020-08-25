class UsersController < ApplicationController
    get '/signup' do
        if logged_in? 
            redirect to '/gems'
        else 
            erb :'users/signup'
        end
    end

    post '/signup' do
        if params[:username] == "" || params[:password] == ""   #convert to username validation later
            #insert flash message
            redirect to '/signup'
        else 
            @user=User.create(:username => params[:username], :password => params[:password]) #check if params works here as well
            session[:user_id] = @user.id
            redirect to '/gems'
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