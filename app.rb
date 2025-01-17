require 'sinatra/base'
require "sinatra/reloader"

require_relative "./lib/peep_repository"
require_relative "./lib/peep"
require_relative "./lib/user_repository"
require_relative "./lib/user"

require 'pg'
require_relative './lib/database_connection'

connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    @top_peeps = []
    repo = PeepRepository.new
    users = UserRepository.new
    result = repo.ordered
    result.each do |item|
      user = users.find_by_id(item.user_id)
      date = item.time_of_posting.slice!(0,16)
      @top_peeps << [item.content, date, user.username, user.name, item.user_id]
    end
    return erb(:index)
  end

  post '/' do
    repo = PeepRepository.new
    users = UserRepository.new
    
    name = params[:username]
    find_user_id = users.find_by_username(name)
    user_id = find_user_id.id
    content = params[:peep]
    time = Time.now
    new_peep = Peep.new(content, time, user_id)
    repo.create(new_peep)
    redirect '/'
  end

  get '/users/:id' do
    @user_id = params[:id]
    repo = PeepRepository.new
    users = UserRepository.new
    @peeps = []
    user = users.find_by_id(@user_id)
    @username = user.username
    @bio = user.bio
    @name = user.name

    result = repo.find(@user_id)
    
    result.each do |item|
      date = item.time_of_posting.slice!(0,16)
      @peeps << [item.content, date]
    end

    return erb(:peeps)
  end

  get '/new_user' do
    return erb(:create_account)
  end

  post '/new_user' do
    @name = params[:name] 
    @username = params[:username] 
    @email = params[:email] 
    @password = params[:password] 
    @bio = "None yet!"

    return erb(:create_account)
  end
end
