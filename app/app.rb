ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookMarkManager < Sinatra::Base
  # get '/' do
  #   'You are on the homepage'
  # end

  get '/links' do
    @links = Link.all
    erb :'links/index'    #looks into views directory first
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url],
                    title: params[:title])
    tag = Tag.first_or_create(name: params[:tags]) #find first tag with name passed into params or if not found create tag with that name
    link.tags << tag
    link.save
    redirect to('/links')
    # Link.create(url: params[:url], title: params[:title])
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end
end

# start the server if ruby file executed directly
# run! if app_file == $0
