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
                @gem = current_user.gemstones.build(name: params[:name], description: params[:description])
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
            # binding.pry
            @gem = Gemstone.find_by_id(params[:id])
            if @gem
                erb :'gems/show_gem'
            else 
                #insert flash message about gem page don't exist
                redirect '/gems'
            end
        end
    end

    get '/gems/:id/edit' do
        # binding.pry
        if !logged_in? 
            redirect_if_not_logged_in
        else 
            @gem = Gemstone.find_by_id(params[:id])
            if @gem && @gem.user == current_user
                erb :'/gems/edit_gem'
            else 
                #add in flash message about not have proper credentials to edit gem
                redirect '/gems'
            end
        end
    end

    patch '/gems/:id' do
        if logged_in? 
            if params[:name] == "" || params[:description] == ""
                #insert flash message about no blanks
                redirect "/gems/#{params[:id]}/edit"
            else
                @gem = Gemstone.find_by(params[:id])
                if @gem && @gem.user == current_user
                    if @gem.update(description: params[:description])
                        redirect "/gems/#{@gem.id}"
                    else
                        redirect "/gems/#{@gem.id}/edit"
                    end
                else
                    redirect "/gems"
                end
            end
        else
            redirect_if_not_logged_in
        end
    end

    delete '/gems/:id/delete' do
        redirect_if_not_logged_in
        @gem = Gemstone.find_by_id(params[:id])
        if @gem && @gem.user == current_user
            #insert flash message here
            @gem.delete
            redirect "/gems/#{current_user.slug}"
        else 
            redirect "/gems"
            #insert flash message about not having credentials to do this action 
        end
    end
end