require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set views: 'lib/views'
  end

  get '/motorcycles' do
    @motorcycles = Motorcycle.all
    erb :index
  end

  get '/motorcycles/new' do
    erb :new
  end

  post '/motorcycles/new' do
    new = Motorcycle.create(make: params[:make], model: params[:model], engine_cc: params[:engine_cc])
    redirect "/motorcycles/#{new.id}"  #DOUBLE QUOTES!!!!
    #grab the params and redirecrt to the bike page
  end

  get '/motorcycles/:id' do
    @new = Motorcycle.find(params[:id])
    erb :show
  end

  get '/motorcycles/:id/edit' do
    # edit current motorcycle
    @new = Motorcycle.find(params[:id])
    erb :edit
  end

  patch '/motorcycles/:id' do
    #update the instance
    new = Motorcycle.update(params[:id], make: params[:make], model: params[:model], engine_cc: params[:engine_cc])
    redirect "/motorcycles/#{new.id}"
  end

  delete '/motorcycles/:id/delete' do
    #delete instance
    Motorcycle.destroy(params[:id])
    redirect "/motorcycles"
  end









end
