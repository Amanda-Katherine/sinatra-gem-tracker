class UsersController < ApplicationController
    get '/signup' do
        if logged_in? 
            redirect to '/gems'
        else 
            erb :'users/signup'
        end
    end




end