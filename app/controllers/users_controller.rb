class UsersController < ApplicationController
    
    get '/signup' do
        if current_user 
            redirect to '/'
        end
        
        erb :'users/signup'
    end

    post '/signup' do
        params[:username] = params[:username].downcase
        @user=User.create(params) 

        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect to '/gems'
        else 
           flash[:message] = @user.errors.full_messages.join(",").gsub(",","  &&  ")
            redirect to '/signup'
        end
    end

    get '/users/:slug' do 
        redirect_if_not_logged_in
        @user = User.find_by_slug(params[:slug])
        
        if !!@user
            erb :"/users/users_gems"
        else
            flash[:message] = "Hmmm...I know you have imaginary friends, but this one doesn't exist."
            redirect '/gems'
        end
    end

    get '/login' do
        if current_user
            redirect to '/' 
        end

        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by_username(params[:username])
        
        if @user && @user.authenticate(params[:password])
            flash[:message] = ""
            session[:user_id] = @user.id
            redirect to '/gems'
        else
            flash[:message] = "Invalid login."
            erb :'users/login'
        end
    end

    get '/logout' do
        session.destroy

        redirect to '/'
    end
end