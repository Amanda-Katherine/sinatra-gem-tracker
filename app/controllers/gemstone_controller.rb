class GemstoneController < ApplicationController
    get '/gems' do
        @gems = Gemstone.all
        erb :'gems/all_gems'
    end
end