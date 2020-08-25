class GemstoneController < ApplicationController
    get '/gems' do
        @gems = Gemstone.all
        erb :'gems/all_gems'
    end

    get '/gems/new' do
        if !logged_in? 
            redirect_if_not_logged_in
        else 
            erb :'/gems/create_gem'
        end
    end
end