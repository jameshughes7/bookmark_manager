ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/link'

class BookMarkManager < Sinatra::Base
  get '/' do
    'You are on the homepage'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'    #looks into views directory first
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end
end

# start the server if ruby file executed directly
# run! if app_file == $0
