require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  has n, :tags, through: Resource #one tag can have many links and one link can have many tags
  #whic is probably why we have link.save in app.rb

  property :id, Serial
  property :title, String
  property :url, String

end
