require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end
  get '/create.erb' do
    erb :create
  end

  post '/results' do
    user_sentence=params[:sentence]
    @translated_sentence=to_pig_latin(user_sentence)
    erb :results
  end 
  
end