class GemstoneController < ApplicationController
    get '/gems' do
        @gems = Gemstone.all.sort_by {|gem| gem.description.length && gem.name.downcase}.uniq {|gem| gem.name.downcase}
        
        erb :'gems/all_gems'
    end

    post '/gems' do
        if logged_in? 
                gem = current_user.gemstones.build(name: params[:name], description: params[:description])
                if gem.save
                    redirect "/gems/#{gem.id}"
                else
                    redirect '/gems/new'
                end
        else
            redirect '/login'
        end
    end

    get '/gems/new' do
        if !logged_in? 
            redirect_if_not_logged_in
        else 
            erb :'/gems/create_gem'
        end
    end

    get '/gems/:id' do
        redirect_if_not_logged_in
        @gem = Gemstone.find_by_id(params[:id])
       
        if @gem
            erb :'gems/show_gem'
        else 
            flash[:message] = "Looks like that gem doesn't exist. Checkout what we do have in the mine."

            redirect '/gems'
        end
    end

    get '/gems/:id/edit' do
        redirect_if_not_logged_in
        @gem = Gemstone.find_by_id(params[:id])  
        
        redirect_if_not_creator(@gem)
        
        if @gem && gem_creator?(@gem)
            erb :'/gems/edit_gem'
        else
            flash[:message] = "Well, that gem doesn't exist. Keep mining."
            redirect '/gems'
        end
       
    end

    patch '/gems/:id' do
        redirect_if_not_logged_in
            if params[:name] == "" || params[:description] == ""
                #insert flash message about no blanks
                redirect "/gems/#{params[:id]}/edit"
            else
                @gem = Gemstone.find_by_id(params[:id])
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
    end

    delete '/gems/:id' do
        redirect_if_not_logged_in
        @gem = Gemstone.find_by_id(params[:id])
        if @gem && gem_creator?(@gem)
            #insert flash message here
            @gem.delete
            redirect "/users/#{current_user.slug}"
        else 
            redirect "/gems"
            #insert flash message about not having credentials to do this action 
        end
    end
end