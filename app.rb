require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class Bookmark_Manager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end