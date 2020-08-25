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

    post '/gems' do
        if logged_in? 
            if params[:name] == "" || params[:description] == ""
                #insert flash message about no blanks
                redirect '/gems/new'
            else
                @gem = current_user.gems.build(name: params[:name], description: params[:description])
                if @gem.save
                    redirect "/gems/#{@gem.id}"
                else
                    redirect '/gems/new'
                end
            end
        else
            redirect '/login'
        end
    end

    get '/gems/:id' do
        if !logged_in? 
            redirect_if_not_logged_in
        else 
            @gem = Gem.find_by(params[:id])
            erb :'gems/show_gem'
        end
    end




end