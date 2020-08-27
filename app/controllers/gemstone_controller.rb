class GemstoneController < ApplicationController
    get '/gems' do
        @gems = Gemstone.all.sort_by {|gem| gem.description.length}.reverse.sort_by{|gem| gem.name.downcase}.uniq {|gem| gem.name.downcase}
        
        erb :'gems/all_gems'
    end

    get '/gems/new' do   
        redirect_if_not_logged_in
        erb :'/gems/create_gem'
    end

    post '/gems' do
        redirect_if_not_logged_in

        gem = current_user.gemstones.build(name: params[:name], description: params[:description])
        if gem.save
            redirect "/gems/#{gem.id}"
        else
            redirect '/gems/new'
        end
    end

    get '/gems/:id' do
        redirect_if_not_logged_in
        @gem = Gemstone.find_by_id(params[:id])
       
        if @gem
            erb :'gems/show_gem'
        else 
            flash[:message] = "Hmmm...that gem doesn't exist. Checkout what gems we do have in the mine."

            redirect '/gems'
        end
    end

    get '/gems/:id/edit' do
        redirect_if_not_logged_in
        @gem = Gemstone.find_by_id(params[:id])  
        
        redirect_if_not_creator(@gem) if @gem
        
        if @gem && gem_creator?(@gem)
            erb :'/gems/edit_gem'
        else
            flash[:message] = "Well, that gem doesn't exist. Keep mining."
            redirect '/gems'
        end  
    end

    patch '/gems/:id' do
        redirect_if_not_logged_in

        @gem = Gemstone.find_by_id(params[:id])
        
        if @gem && gem_creator?(@gem)
            if @gem.update(name: params[:name], description: params[:description])
                redirect "/gems/#{@gem.id}"
            else
                flash[:message] = "Whoops, looks like that didn't work. It's possible you had a blank input."
                redirect "/gems/#{@gem.id}/edit"
            end
        else
            redirect "/gems"
        end
    end

    delete '/gems/:id' do
        redirect_if_not_logged_in
        @gem = Gemstone.find_by_id(params[:id])
        redirect_if_not_creator(@gem)

        if @gem && gem_creator?(@gem)
            flash[:message] = "That gem is gone forever."
            @gem.delete
            redirect "/users/#{current_user.slug}"
        end
    end
end